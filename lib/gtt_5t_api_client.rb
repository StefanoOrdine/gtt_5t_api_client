require 'gtt_5t_api_client/version'
require 'net/http'
require 'date'
require 'nokogiri'
require 'pry'

module Gtt5tApiClient
  SCHEME = 'http'
  BASE_DOMAINE = 'www.5t.torino.it'

  class TimeTable
    class DOMTable
      class DOMRow
        def initialize(dom_row)
          @dom_row = dom_row
        end

        def bus_number
          @dom_row.css('a').first.text
        end

        def arrival_times
          @dom_row
            .css('td')
            .select { |element| element.is_a?(Nokogiri::XML::Element) }
            .drop(1)
            .map(&:text)
        end
      end

      def initialize(dom_table)
        @dom_table = dom_table
      end

      def dom_rows
        @dom_table
          .css('tr')
          .select { |element| element.is_a?(Nokogiri::XML::Element) }
          .map { |element| DOMRow.new(element) }
      end
    end

    PATH = '/5t/trasporto/arrival-times-byline.jsp'

    def initialize
      @base_url = "#{SCHEME}://#{BASE_DOMAINE}#{PATH}"
    end

    def get_times_for(stop_id, datetime)
      response = Net::HTTP.get(URI("#{@base_url}?action=getTransitsByLine&shortName=#{stop_id}&oreMinuti=#{query_time}&gma=#{query_date}"))
      dom_table = DOMTable.new(Nokogiri::HTML(response))
    end

    private

    def query_time
      DateTime.now.strftime('%H:%M')
    end

    def query_date
      DateTime.now.strftime('%d/%m/%Y')
    end
  end
end

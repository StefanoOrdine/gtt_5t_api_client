require 'gtt_5t_api_client/time_table/dom_table'

module Gtt5tApiClient
  class TimeTable
    PATH = '/5t/trasporto/arrival-times-byline.jsp'

    def initialize(stop_id, datetime)
      @stop_id = stop_id
      @datetime = datetime
      @base_url = "#{SCHEME}://#{BASE_DOMAINE}#{PATH}"
    end

    def times
      @times ||= dom_table.times
    end

    def stop_name
      @stop_name ||= dom.css('span').first.text
    end

    private

    def dom
      @dom ||= Nokogiri::HTML(response)
    end

    def dom_table
      @dom_table ||= DOMTable.new(dom.css('table'))
    end

    def response
      @response ||= Net::HTTP.get(URI(time_table_uri))
    end

    def time_table_uri
      @time_table_uri ||= "#{@base_url}?action=getTransitsByLine&shortName=#{@stop_id}&oreMinuti=#{query_time}&gma=#{query_date}"
    end

    def query_time
      @datetime.strftime('%H:%M')
    end

    def query_date
      @datetime.strftime('%d/%m/%Y')
    end
  end
end

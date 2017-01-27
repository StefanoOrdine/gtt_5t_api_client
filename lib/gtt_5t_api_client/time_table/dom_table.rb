require 'gtt_5t_api_client/time_table/dom_row'

module Gtt5tApiClient
  class TimeTable
    class DOMTable
      def initialize(dom_table)
        @dom_table = dom_table
      end

      def times
        @times ||= dom_rows.inject({}) do |hash, dom_row|
          hash.merge!(:"#{dom_row.bus_number}" => dom_row.arrival_times)
        end
      end

      private

      def dom_rows
        @dom_rows ||= @dom_table
          .css('tr')
          .select { |element| element.is_a?(Nokogiri::XML::Element) }
          .map { |element| DOMRow.new(element) }
      end
    end
  end
end

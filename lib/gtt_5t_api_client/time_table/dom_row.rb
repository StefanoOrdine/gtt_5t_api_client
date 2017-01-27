module Gtt5tApiClient
  class TimeTable
    class DOMRow
      def initialize(dom_row)
        @dom_row = dom_row
      end

      def bus_number
        @bus_number ||= @dom_row.css('a').first.text
      end

      def arrival_times
        @arrival_times ||= @dom_row
          .css('td')
          .select { |element| element.is_a?(Nokogiri::XML::Element) }
          .drop(1)
          .map(&:text)
          .reject(&:empty?)
      end
    end
  end
end

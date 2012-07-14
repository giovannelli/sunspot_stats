module Sunspot
  module Search
    class StatFacet

      def initialize(field, search, options)
        @field, @search, @options = field, search, options
      end

      def field_name
        @field.name
      end

      def rows
        @options[:type] ||= "sum"
        @sort = false
        @rows ||=
        begin
          if !@search.stat_response['stats_fields'].nil?
            if @options[:facet].present?
              stat = @search.stat_response['stats_fields'][@field.indexed_name]
              data = stat.nil? ? [] : stat['facets'][@options[:facet].indexed_name]
              @sort = true
            else
              data = @search.stat_response['stats_fields'].to_a
            end
          end

          rows = []

          data.collect do |stat, value|
            rows << StatRow.new(stat, value[@options[:type]], self)
          end

          if @options[:sort] == :type
            rows.sort! { |lrow, rrow| rrow.count <=> lrow.count }
          else
            rows.sort! { |lrow, rrow| lrow.stat_field <=> rrow.stat_field }
          end if @sort
          rows
        rescue Exception => e
          puts "Error: #{e}"
        end
      end
    end
  end
end
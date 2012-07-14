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
        @options[:stat_type] ||= "sum"
        @rows ||=
          begin
            if @options[:facet].present?
              data = @search.stat_response['stats_fields'][@field.indexed_name]['facets'][@options[:facet].indexed_name]
            else
              data = @search.stat_response['stats_fields'].to_a
            end
            
            rows = []
            
            data.collect do |stat, value|
              rows << StatRow.new(stat, value[@options[:stat_type]], self)
            end

            if @options[:sort] == :count
              rows.sort! { |lrow, rrow| rrow.count <=> lrow.count }
            else
              rows.sort! { |lrow, rrow| lrow.value <=> rrow.value }
            end
            rows
          end
      end
    end
  end
end

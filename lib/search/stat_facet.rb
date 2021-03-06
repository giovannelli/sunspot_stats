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
        #sort options :count or :stat_field 
        @options[:sort] ||= :count
        @options[:type] ||= "sum"
        @options[:limit] ||= -1
        @sort = false
        @rows ||=
        begin
          if @search.stat_response.present? && @search.stat_response['stats_fields'].present?
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
            rows << StatRow.new(stat, value[@options[:type]], value, self) if value.present?
          end

          if @options[:sort] == :count
            rows.sort! { |lrow, rrow| rrow.value <=> lrow.value }
          else
            rows.sort! { |lrow, rrow| lrow.stat_field <=> rrow.stat_field }
          end if @sort
          return rows.empty? ? [] : rows[0..@options[:limit]]
        rescue Exception => e
          puts "Sunspot Stats error: #{e.message} \n\n #{e.backtrace}"
          return []
        end
      end
    end
  end
end
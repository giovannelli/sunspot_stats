module Sunspot
  module Query
    #
    # A FieldStat stats by the unique values of a given field.
    #
    class FieldStat

      def initialize(field, options = {})
        if field.multiple?
          raise(ArgumentError, "#{field.name} cannot be used for stats because it is a multiple-value field")
        end
        @field = field
        @options = options
        @sort = SortComposite.new
      end

      def add_sort(sort)
        @sort << sort
      end

      def to_params
        params = {
          :stats  => 'true',
          :"stats.field" => @field.indexed_name
        }
        params.merge!({:"stats.facet" => @options[:facet].indexed_name}) if !@options[:facet].nil?
        params.merge!({:"facet.limit" => @options[:limit]}) if !@options[:limit].nil?
        params
      end
    end
  end
end
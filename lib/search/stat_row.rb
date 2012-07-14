module Sunspot
  module Search
    class StatRow
      attr_reader :stat_field, :value
      attr_writer :instance #:nodoc:

      def initialize(stat_field, value, stat) #:nodoc:
        @stat_field, @value, @stat = stat_field, value, stat
      end

      # 
      # Return the instance referenced by this facet row. Only valid for field
      # facets whose fields are defined with the :references key.
      #
      def instance
        if !defined?(@instance)
          @stat.populate_instances
        end
        @instance
      end

      def inspect
        "<Sunspot::Search::StatRow:#{stat_field.inspect} (#{value})>"
      end
    end
  end
end

module Sunspot
  module Search
    class StatRow
      attr_reader :field, :value
      attr_writer :instance #:nodoc:

      def initialize(field, value, stat) #:nodoc:
        @field, @value, @stat = field, value, stat
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
        "<Sunspot::Search::StatRow:#{field.inspect} (#{value})>"
      end
    end
  end
end

module Sunspot
  module Search
    class StatRow
      attr_reader :stat_field, :value, :all_values
      attr_writer :instance #:nodoc:

      def initialize(stat_field, value, all_values, stat) #:nodoc:
        @stat_field, @value, @all_values, @stat = stat_field, value, all_values, stat
      end

      # 
      # Return the instance referenced by this stat row. Only valid for field
      # stats whose fields are defined with the :references key.
      #
      
      def instance
        if !defined?(@instance)
          @stat.populate_instances
        end
        @instance
      end

      def inspect
        "<Sunspot::Search::StatRow:#{stat_field.inspect} (#{value} - #{all_values})>"
      end
    end
  end
end

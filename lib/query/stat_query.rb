module Sunspot
  module Query #:nodoc:
    class CommonQuery

      def add_stat(stat)
        @components << stat
        stat
      end

    end
  end
end

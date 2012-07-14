module Sunspot
  module DSL
    # 
    # Provides an API for areas of the query DSL that operate on specific
    # fields. This functionality is provided by the query DSL and the dynamic
    # query DSL.
    #
    class FieldQuery < Scope
      def initialize(search, query, setup) #:nodoc:
        @search, @query = search, query
        super(query.scope, setup)
      end

      def stat(field_name, options = {})
        field = @setup.field(field_name)
        options[:facet] = @setup.field(options[:facet]) if options[:facet].present?
        stat = @query.add_stat(Sunspot::Query::FieldStat.new(field, options))
        @search.add_field_stat(field, options)
      end
          
  end
end

require 'sunspot/search/paginated_collection'
require 'sunspot/search/hit_enumerable'

module Sunspot
  module Search #:nodoc:
    
    # 
    # This class encapsulates the results of a Solr search. It provides access
    # to search results, total result count, facets, and pagination information.
    # Instances of Search are returned by the Sunspot.search and
    # Sunspot.new_search methods.
    #
    class AbstractSearch
      # 
      # Retrieve all facet objects defined for this search, in order they were
      # defined. To retrieve an individual facet by name, use #facet()
      #
      attr_reader :stats

      def initialize(connection, setup, query, configuration) #:nodoc:
        @connection, @setup, @query = connection, setup, query
        @query.paginate(1, configuration.pagination.default_per_page)

        @stats = []
        @stats_by_name = {}

        @facets = []
        @facets_by_name = {}

        @groups_by_name = {}
        @groups = []
      end


      def stat(name)
        if name
          @stats_by_name[name.to_sym]
        end
      end

      def stat_response #:nodoc:
        @solr_result['stats']["stats_fields"].each_pair do |k, value|
          if value && value.key?("facets")
            value["facets"].each_pair do |k1, value1|
              value1.each_pair do |k2, value2|
                if @solr_result['stats']['stats_fields'][k]['facets'][k1][k2]['mean'].to_s == 'NaN'
                  @solr_result['stats']['stats_fields'][k]['facets'][k1][k2]['mean'] = 0.0
                end
              end
            end
          end
        end
        @solr_result['stats']||[]
      end

      def add_field_stat(field, options = {}) #:nodoc:
        name = (options[:name] || field.name)
        add_stat(name, StatFacet.new(field, self, options))
      end
      
      def add_stat(name, stat)
        @stats << stat
        @stats_by_name[name.to_sym] = stat
      end
      
    end
  end
end

require "sunspot_stats/version"

%w(field_query).each do |file|
  require File.join(File.dirname(__FILE__), "dsl", file)
end


%w(stat_search stat_row stat_facet).each do |file|
  require File.join(File.dirname(__FILE__), "search", file)
end

%w(stat_query field_stat edismax).each do |file|
  require(File.join(File.dirname(__FILE__), 'query', file))
end


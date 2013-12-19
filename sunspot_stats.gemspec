# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sunspot_stats/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["duccio giovannelli"]
  gem.email         = ["giovannelli@extendi.it"]
  gem.description   = <<-TEXT
      Sunspot is a library providing a powerful, all-ruby API for the Solr search engine. This gem extend sunspot adding the 
      statsComponent feature, which returns simple statistics for indexed numeric fields within the DocSet.
    TEXT
  gem.summary       = "Added the statsComponent to sunspot"
  gem.homepage      = "https://github.com/giovannelli/sunspot_stats"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sunspot_stats"
  gem.require_paths = ["lib"]
  gem.version       = SunspotStats::VERSION
  
  gem.add_development_dependency "rspec"
  
  gem.rdoc_options << '--webcvs=http://github.com/giovannelli/sunspot_stats/tree/master/%s' <<
                   '--title' << 'Sunspot Stat - StatsComponent for sunspot - API Documentation' <<
                   '--main' << 'README.rdoc'
end

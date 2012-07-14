# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sunspot_stats/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["duccio"]
  gem.email         = ["giovannelli@extendi.it"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = "Add the statsComponent to sunspot"
  gem.homepage      = <<-TEXT
      Sunspot is a library providing a powerful, all-ruby API for the Solr search engine. This gem extend sunspot adding the 
      statsComponent feature, which returns simple statistics for indexed numeric fields within the DocSet. Usually Suspot use the dismax
      for searches, here we extend to edismax to manage also boolean logic searches.
    TEXT
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sunspot_stats"
  gem.require_paths = ["lib"]
  gem.version       = SunspotStats::VERSION
  
  
  gem.add_dependency "sunspot", "~> 2.0.0.pre.120417"
end

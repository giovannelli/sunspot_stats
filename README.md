# Sunspot Stats

Sunspot is a Ruby library for expressive, powerful interaction with the Solr search engine. I use the latest version [2.1.0](http://rubygems.org/gems/sunspot/versions/2.1.0) but i need the statsComponent in order to get the sum (min, max, count, sumOfSquares, mean, stddev) on a given indexed field. 

## Installation

Add this line to your application's Gemfile:

    gem 'sunspot_stats'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sunspot_stats

## Usage

The statComponent let you to have *min*, *max*, *count*, *missing*, *sum*, *sumOfsquare*, *mean* and *stdev*.

### An usage example

```ruby
Model.search do
  #Filters
	...
  #Facets
  ...
	#Stats
  stat(:your_field, :facet => :your_facet_filed, :type => "min")  
  ...
end
```

**:facet** and **:type** are optional the default type is the "sum" (you can pass: *min*, *max*, *count*, *missing*, *sum*, *sumOfsquare*, *mean*, *stdev* as string)

Remember to stats on a non multi valued field and update to the solr3.6, because the solr3.5 has a bug with stats.

the Sunspot::SearchStatRow has the method *stat_field* and the *value*. 

If you enable faceting on stats the stat_field is the facet and the value is the type defined.

[Upgrade solr in sunspot](https://github.com/sunspot/sunspot/wiki/Upgrading-sunspot_solr-Solr-Instance) 


### StatsComponent Notes

The facet field can be selectively applied. That is if you want stats on field "A" and "B", you can facet a on "X" and B on "Y" using &stats.field=A&f.A.stats.facet=X&stats.field=B&f.B.stats.facet=Y

*Warning*, as implemented, all facet results are returned, be careful what fields you ask for!

Multi-valued fields and facets may be slow.

[StatsComponent](http://wiki.apache.org/solr/StatsComponent)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

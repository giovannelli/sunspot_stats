# SunspotStats

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'sunspot_stats'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sunspot_stats

## Usage

Sunspot is a Ruby library for expressive, powerful interaction with the Solr search engine. I use the latest version [2.0.0.pre.120417](https://rubygems.org/gems/sunspot/versions/2.0.0.pre.120417) but i need the statsComponent in order to get the sum on a given indexed field. 

The statComponent let you to have *min*, *max*, *count*, *missing*, *sum*, *sumOfsquare*, *mean* and *stdev*.

### An usage example

```ruby
Model.search do
  #Filters
	...
  #facets
  ...
	#stats
  stat(:your_field, :facet => :your_facet_filed, :type => "min")  
  ...
end
```

**:facet** and **:type** are optional the default type is the "sum" (you can pass: *min*, *max*, *count*, *missing*, *sum*, *sumOfsquare*, *mean*, *stdev* as string)

Remember to stats on a non multi valued field and update to the solr3.6, because the solr3.5 has a bug with stats.

the Sunspot::SearchStatRow has the method *stat_field* and the *value*. 

If you enable faceting on stats the stat_field is the facet and the value is the type defined.

[Upgrade solr in sunspot](https://github.com/sunspot/sunspot/wiki/Upgrading-sunspot_solr-Solr-Instance) 

### Boolean Searches

Usually Suspot use the dismax for searches, here we extend to edismax to manage also boolean logic searches

a OR (b AND c) works.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

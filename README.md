# Jv

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/jv`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jv

## Usage

You write view file with extension `xxx.json.jv`
```ruby
json = {}
json[:string_property] = @string
json[:integer_property] = 123
json[:array_property] = @integers
json[:object_property] = {
  single_partial: r.(partial: 'api/record', locals: { record: { a: 123, b: 100 } }),
  collection_partial: r.(partial: 'api/record', collection: @records, as: :record)
}
json
```

This response is following
```javascript
{
  "string_property": "string",
  "integer_property": 123,
  "array": [
    1,
    2,
    3,
    4,
    5
  ],
  "object_property": {
    "single_partial": {
      "a": 123,
      "b": 100
    },
    "collection_partial": [
      {
        "a": 123,
        "b": 234
      },
      # ...
    ]
  }
}
```

## Benchmark

Benchmark script is there.
* [bin/benchmark.rb](https://github.com/tzmfreedom/jv/blob/master/spec/dummy_app/bin/benchmark.rb)
* [api_controller.rb](https://github.com/tzmfreedom/jv/blob/master/spec/dummy_app/app/controllers/api_controller.rb)

### Result

Development
```
* Rendering 10 partials via render_partial
Warming up --------------------------------------
            jbuilder     8.000  i/100ms
                  jv    10.000  i/100ms
Calculating -------------------------------------
            jbuilder     79.193  (± 7.6%) i/s -    400.000  in   5.085408s
                  jv    106.160  (± 6.6%) i/s -    530.000  in   5.013174s

Comparison:
                  jv:      106.2 i/s
            jbuilder:       79.2 i/s - 1.34x  slower


* Rendering 100 partials via render_partial
Warming up --------------------------------------
            jbuilder     1.000  i/100ms
                  jv     7.000  i/100ms
Calculating -------------------------------------
            jbuilder     14.927  (±13.4%) i/s -     74.000  in   5.029316s
                  jv     71.601  (± 7.0%) i/s -    357.000  in   5.019427s

Comparison:
                  jv:       71.6 i/s
            jbuilder:       14.9 i/s - 4.80x  slower


* Rendering 1000 partials via render_partial
Warming up --------------------------------------
            jbuilder     1.000  i/100ms
                  jv     1.000  i/100ms
Calculating -------------------------------------
            jbuilder      1.614  (± 0.0%) i/s -      9.000  in   5.587806s
                  jv     19.176  (±10.4%) i/s -     95.000  in   5.001148s

Comparison:
                  jv:       19.2 i/s
            jbuilder:        1.6 i/s - 11.88x  slower
```

Production
```
* Rendering 10 partials via render_partial
Warming up --------------------------------------
            jbuilder    48.000  i/100ms
                  jv    88.000  i/100ms
Calculating -------------------------------------
            jbuilder    496.263  (± 8.7%) i/s -      2.496k in   5.075655s
                  jv    888.175  (± 7.0%) i/s -      4.488k in   5.080282s

Comparison:
                  jv:      888.2 i/s
            jbuilder:      496.3 i/s - 1.79x  slower


* Rendering 100 partials via render_partial
Warming up --------------------------------------
            jbuilder     6.000  i/100ms
                  jv    18.000  i/100ms
Calculating -------------------------------------
            jbuilder     64.780  (±10.8%) i/s -    324.000  in   5.069040s
                  jv    192.008  (± 6.2%) i/s -    972.000  in   5.082385s

Comparison:
                  jv:      192.0 i/s
            jbuilder:       64.8 i/s - 2.96x  slower


* Rendering 1000 partials via render_partial
Warming up --------------------------------------
            jbuilder     1.000  i/100ms
                  jv     2.000  i/100ms
Calculating -------------------------------------
            jbuilder      6.645  (±15.0%) i/s -     33.000  in   5.001550s
                  jv     23.705  (± 8.4%) i/s -    118.000  in   5.000942s

Comparison:
                  jv:       23.7 i/s
            jbuilder:        6.6 i/s - 3.57x  slower
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jv.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

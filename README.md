# Gtt5tApiClient

This gem provides GTT (Gruppo Torinese Trasporti) stop arrivals in real time. Since the 5T (Tecnologie Telematiche Trasporti Traffico Torino) does not provide any public API to retrieve information on real time stop arrivals, I created this gem with the purpose of make easy and pleasing to developers retriving these valuable information. Data are scraped from [Arrivi in Fermata](http://www.5t.torino.it/5t/it/trasporto/arrivi-fermata.jsp) web page of the [official 5T website](http://www.5t.torino.it/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gtt_5t_api_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gtt_5t_api_client

## Usage

The module `Gtt5tApiClient` provides a `TimeTable` class that can be used to retrieve arrivals times giving a stop identification number and a `DateTime` object describing the interested moment:

```
time_table = Gtt5tApiClient::TimeTable.new(64, DateTime.now)

time_table.times
=> {
  :"1"=>["20:43*", "20:56*", "21:10*"],
  :"18"=>["20:42*", "20:54*", "21:02*"],
  :"24"=>["20:59"],
  :"35"=>["20:39", "20:55*", "20:56*"],
  "93B"=>["22:26"]
}
```

Times with `*` like `"20:42*"` are in real time. You can also get the stop name by calling

```
time_table.stop_name
=> "64 LINGOTTO EXPO"
```

Enjoy!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/StefanoOrdine/gtt_5t_api_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

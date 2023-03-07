# Network::Latency

This is a simple example tracking network latency from different websites.

The data is piped to timescaledb.

## Installation

Join the directory and then execute:

    $ bundle install

## Usage

Adapt the `.env.example` to an URI for a postgresql instance that has
Timescaledb installed.

```bash
cp .env.example .env
```

Then source it to make the `PG_URI` environment variable available.

```
source .env
```

You can use `bin/track` to generate a new set of records.

To keep watching just combine with the watch command:

```
watch bin/track
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

The repository all in one file. You can find all the code on [lib/network/latency.rb](./lib/network/latency.rb).

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

This is an toy example, feel free to submit a PR if you think that it's outdated or
if you want to improve it.


```ruby
Network::Latency::Ping.stats.map(&:attributes)
=> [{"start"=>2022-08-05 14:23:21.439023 UTC,
  "end"=>2023-03-07 23:25:00.10166 UTC,
  "average"=>0.124060377358490566e-2,
  "min"=>0.4e-3,
  "max"=>0.51e-2}]

```

You can also filter or group by host:

```ruby
Network::Latency::Ping.select(:host).group(:host).stats.map(&:attributes)
[{"host"=>"twitter.com",
  "start"=>2022-08-05 14:23:21.440123 UTC,
  "end"=>2023-03-07 23:25:00.10166 UTC,
  "average"=>0.118150943396226415e-2,
  "min"=>0.6e-3,
  "max"=>0.39e-2},
 {"host"=>"linkedin.com",
  "start"=>2022-08-05 14:23:21.43988 UTC,
  "end"=>2023-03-07 23:25:00.101544 UTC,
  "average"=>0.120981132075471698e-2,
  "min"=>0.5e-3,
  "max"=>0.39e-2},
  ... ]
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


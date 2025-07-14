# DbipUtil

DbipUtil includes DB-IP Lite databases and a simple interface to them, based on `maxmind-db` gem.

The included databases are refreshed automatically. A GitHub Actions workflow runs `bin/dbiputil-refresh` and then `rake release` at **00:00&nbsp;GMT on the 2nd of every month** to publish a new gem version. Ensure to comply with the database licensing terms below in this document.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add dbip_util
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install dbip_util
```

## Usage

```ruby
record = DbipUtil::Country.get("1.1.1.1")
if record.nil?
  puts '1.1.1.1 was not found in the database'
else
  puts record['country']['iso_code']
  puts record['country']['names']['en']
end

# Also: DbipUtil::ASN, DbipUtil::City
```

This gem uses a `maxmind-db` gem. More documentation is provided by said gem: https://www.rubydoc.info/gems/maxmind-db

The databases are documented here:

- https://db-ip.com/db/format/ip-to-country-lite/mmdb.html
- https://db-ip.com/db/format/ip-to-city-lite/mmdb.html
- https://db-ip.com/db/format/ip-to-asn-lite/mmdb.html

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. If you only need the databases without downloading them from DB-IP directly, run `ruby bin/dbiputil-provision` which extracts them from the latest released gem on RubyGems.

To install this gem onto your local machine, run `bundle exec rake install`. If you need to trigger a release manually, run `bin/dbiputil-refresh` and then `bundle exec rake release`. This will create a git tag for the version, push commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rbutils/dbip_util.

## License

The code inside this gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

Note that this gem contains DB-IP Lite databases. The license terms of those databases are as follows:

```
The free IP to City Lite database by DB-IP is licensed under a
Creative Commons Attribution 4.0 International License.

You are free to use this IP to City Lite database in your application,
provided you give attribution to DB-IP.com for the data.

In the case of a web application, you must include a link back to
DB-IP.com on pages that display or use results from the database.
You may do it by pasting the HTML code snippet below into your code :

<a href='https://db-ip.com'>IP Geolocation by DB-IP</a>
```

# NosqlDb

Basic cli for performing Nosql insert,find, delete queries. It stores the data as json in a file.

## Local Setup

* Clone the repo in your working dir and cd hote_automation.
* Run `bundle install` to install the dependency gems.

## RUN in your local
*  Run `chmod a+x bin/hotel_automation`

## Usage
#### Insert: 
1. Run `./bin/nosql_db insert <stringified-json>` to insert a document.
  Eg: `./bin/nosql_db insert '{"a":4,"b":8}'`

2. Run `./bin/nosql_db find <value-to-matched> <optional, fields to show>` to find a document using value.
   It also supports to show only selected fields.
  Eg: `./bin/nosql_db find  '6' 'a'`

3. Run `./bin/nosql_db delete <key-value>` to be delete a documents.
    Eg: `./bin/nosql_db delete 'b,7'`
## Dependency
* Ruby: 2.5.7
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nosql_db. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NosqlDb project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nosql_db/blob/master/CODE_OF_CONDUCT.md).

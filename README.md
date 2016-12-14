# Cenit Service

Engine that provides controllers to serve Cenit instances

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cenit-service'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cenit-service

## Usage

By default Cenit mount this service engine unless the option `service_url` is present.

To run the service in a different application, which is convenient for asynchronous request operations, just mount this engine in such application.
Don't forget if you do that to configure the `service_url` option in the Cenit instance and be sure that the service url contains the full path to service engine.

## Contributing

1. Fork it ( https://github.com/cenit-io/cenit-service/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

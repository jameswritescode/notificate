# Notificate

Send notifications to a configured endpoint in ruby applications.

## Installation

Add this line to your application's Gemfile:

    gem 'notificate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install notificate

## Usage

### Configuration

```ruby
Notificate.configure hostname: 'example.com', endpoint: 'app_notices', protocol: 'http', port: 1234
```

Optional: `protocol` (default https), `port` (default 80)

#### Rails

Configure Notificate in a file like `config/initializers/notificate.rb`

Then make your application controller look something like this:

```ruby
class ApplicationController < ActionController::Base
  include Notificate::Rails

  enable_notificate_notifications
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/my-new-feature`)
5. Create new Pull Request

## Thanks

Code from [squash_rails](https://github.com/SquareSquash/rails) was used to make the rails functionality possibe.

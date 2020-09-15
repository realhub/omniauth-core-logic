# Omniauth::CoreLogic

This is an unofficial OmniAuth strategy for authenticating with CoreLogic. To get started, read the documentation at https://developer.corelogic.asia

You will need to setup a CoreLogic account. Contact the CoreLogic API team once you are ready.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-core-logic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-core-logic

## Usage with Rails & Devise

Add the following to `config/initializers/devise.rb`
```ruby
config.omniauth :core_logic,
    ENV['CORE_LOGIC_CLIENT_ID'],
    ENV['CORE_LOGIC_SECRET_KEY'],
    :uat => ENV['CORE_LOGIC_API_MODE'] != 'production',
    :scope => 'openid'
```

Add `:core_logic` to the `:omniauth_providers` array for your devise model. e.g.

```ruby
class User < ApplicationRecord
  devise :omniauthable, :omniauth_providers => [:core_logic]
end
```

You can then access the url using the helper `user_core_logic_omniauth_authorize_path`

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :core_logic, ENV['CORE_LOGIC_CLIENT_ID'], ENV['CORE_LOGIC_SECRET_KEY'], scope: 'openid'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-core-logic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::CoreLogic project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/omniauth-core-logic/blob/master/CODE_OF_CONDUCT.md).

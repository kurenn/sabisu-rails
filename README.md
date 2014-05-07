# [Sabisu](https://github.com/IcaliaLabs/sabisu)

Sabisu is a powerful postman-like engine client to explore your Rails application api. It's still under heavy development, but it is quite impressive and beautiful. Give it a try!

It was created by [Abraham Kuri](https://twitter.com/kurenn) from [Icalia Labs](http://twitter.com/icalialabs).

To get started, checkout:

#### [http://icalialabs.github.io/sabisu/](http://icalialabs.github.io/sabisu/)

## Table of contents

- [Installation](#installation)
- [Customization](#customization)
- [Bug tracker & feature request](#bug-tracker-&-feature-request)
- [Contributing](#contributing)
- [Community](#community)
- [Heroes](#heroes)
- [License](#license)

## Quick start

Install sabisu is extremely easy, just add some gems to your `Gemfile`

```ruby
gem 'sabisu-rails'
gem 'compass-rails'
gem 'furatto'
gem 'font-awesome-rails'
```
And then execute:

```console
$ bundle install
```

After you install Sabisu you need to run the generator:

```console
rails g sabisu:install
```

The generator will install in initializer which describes all the Sabisu configuration options.

Some of these configuration options include you api endpoint base uri, so as your resources, so you better take a look at it.

Once you are done with the configuration, start your rails application and navigate to `http://localhost:3000/sabisu/explorer`

If everything went good you should see a nice explorer interface with your resources.

## Customization

Sabisu is highly customizable to make your life easier, here is a quick example of a real app configuration, remember you have the configuration file under `config/initializers/sabisu.rb`.

```ruby
Sabisu.setup do |config|

  # Base uri for posting the 
   config.base_api_uri = 'api.sabisu.dev'

  # Ignored attributes for building the forms
  # config.ignored_attributes = %w{ created_at updated_at id }
  
  # HTTP methods
  # config.http_methods = %w{ GET POST PUT DELETE PATCH }
  
  # Headers to include on each request
  config.api_headers = {'Accept' => 'application/vnd.sabisu.v1'}
  
  # Resources on the api
  config.resources = [:products, :users]

end
```
We invite you to look at the full file for further customization.

## Bug tracker & feature request

Have a bug or a feature request? [Please open a new issue](https://github.com/IcaliaLabs/sabisu/issues). Before opening any issue, please search for existing issues.

We recommend you to read the version [milestiones](https://github.com/IcaliaLabs/sabisu/issues?milestone=2&state=open) if you feel like want to collaborate.

## Contributing

Please submit all pull requests against a separate branch. Although it does not have tests yet, be a nice guy and add some for your feature. We'll be working hard to add them too.

In case you are wondering what to attack, we have a milestone with the version to work, some fixes and refactors. Feel free to start one.

Thanks!

## Community

Keep track of new feautres, development issues and community news.

* Follow [@kurenn](https://twitter.com/kurenn)
* Have a question about anything, email us at weare@icalialabs.com

## Heroes

**Abraham Kuri**

+ [http://twitter.com/kurenn](http://twitter.com/kurenn)
+ [http://github.com/kurenn](http://github.com/kurenn)
+ [http://klout.com/#/kurenn](http://klout.com/#/kurenn)


## Copyright and license

Code and documentation copyright 2013-2014 Icalia Labs. Code released under [the MIT license](LICENSE).

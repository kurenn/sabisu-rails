# [Sabisu](https://github.com/IcaliaLabs/sabisu-rails)

Sabisu is a powerful postman-like engine client to explore your Rails application api. It's still under heavy development, but it is quite impressive and beautiful. Give it a try!

It was created by [Abraham Kuri](https://twitter.com/kurenn) from [Icalia Labs](http://twitter.com/icalialabs).

To get started, checkout:

#### [http://icalialabs.github.io/sabisu-rails/](http://icalialabs.github.io/sabisu-rails/)

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

For projects using Rails 4.2 or newer, configure the following:

```ruby
gem 'sabisu_rails', github: "IcaliaLabs/sabisu-rails"
gem 'compass-rails', '~> 2.0.2'
gem 'furatto'
gem 'font-awesome-rails'
gem 'simple_form'
```

For projects using Rails installations older than 4.2, configure the following:

```ruby
gem 'sabisu_rails'
gem 'compass-rails'
gem 'furatto'
gem 'font-awesome-rails'
gem 'simple_form'
```

And then execute:

```console
$ bundle install
```

After you install Sabisu you need to run the generator:

```console
rails g simple_form:install
rails g sabisu_rails:install
```

The generator will install in initializer which describes all the Sabisu configuration options.

Some of these configuration options include you api endpoint base uri, so as your resources, so you better take a look at it.

Once you are done with the configuration, start your rails application and navigate to `http://localhost:3000/sabisu_rails/explorer`

If everything went good you should see a nice explorer interface with your resources.

## Customization

Sabisu is highly customizable to make your life easier, here is a quick example of a real app configuration, remember you have the configuration file under `config/initializers/sabisu_rails.rb`.

```ruby
SabisuRails.setup do |config|

  # Base uri for posting the 
   config.base_api_uri = 'api.sabisu.dev'

  # Ignored attributes for building the forms
  # config.ignored_attributes = %w{ created_at updated_at id }
  
  # HTTP methods
  # config.http_methods = %w{ GET POST PUT DELETE PATCH }
  
  # Headers to include on each request
  config.api_headers = {'Accept' => 'application/vnd.sabisu.v1'}
  
  # Resources on the api
  # You can customize the resources attributes for setting them on the form for posting to the server like so:
  #
  # config.resources = [{:products => [:title, :price]}, :users]
  #
  # In case you don't specify the attributes, Sabisu will pick them all.
  #
  config.resources = [:products, :users]

end
```

We invite you to look at the full file for further customization.

## Bug tracker & feature request

Have a bug or a feature request? [Please open a new issue](https://github.com/IcaliaLabs/sabisu-rails/issues). Before opening any issue, please search for existing issues.

We recommend you to read the version [milestiones](https://github.com/IcaliaLabs/sabisu-rails/issues?milestone=2&state=open) if you feel like want to collaborate.

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

## A live example

We have deployed an example application on Heroku for you to give it a spin, visit [http://sabisu.herokuapp.com/sabisu_rails/explorer](http://sabisu.herokuapp.com/sabisu_rails/explorer) and because is a demo the api only has GET endpoints.

The authentication credentials are:

```
username: admin
password: sekret
```

The file configuration for Heroku turns out to be more complex, check it out:

```ruby
SabisuRails.setup do |config|

  config.base_api_uri = ENV['API_URL']
  config.resources = [:products,:users]
  config.default_resource = "users"

end
```

We are working to provide a full working example and wiki documentation for further implementation.

## Copyright and license

Code and documentation copyright 2013-2014 Icalia Labs. Code released under [the MIT license](LICENSE).

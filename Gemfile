source 'https://rubygems.org'

# Specify your gem's dependencies in sabisu.gemspec
gemspec

group :development, :test do
  gem 'rubycritic', require: false
  gem 'derailed'
  gem 'bullet'
  gem 'stackprof'
  gem 'traceroute'
  gem 'meta_request'
  gem 'brakeman', require: false
  gem 'rack-mini-profiler'
  gem 'flamegraph'
end

group :test do
  gem 'guard-rspec', '~> 4.6.4', require: false
  gem 'shoulda-matchers', '~> 3.0', require: false
end

group :development do
  gem 'web-console'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec', '~> 1.0.4'
  gem 'guard-spring', '~> 1.1.1'
  gem 'awesome_print'
  gem 'sandi_meter', '~> 1.2.0', require: false
  gem 'reek'
  gem 'rubocop'
end

gem 'railties', github: 'rails/rails'
gem 'activemodel', github: 'rails/rails'
gem 'actionpack', github: 'rails/rails'

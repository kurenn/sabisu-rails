# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sabisu_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "sabisu_rails"
  spec.version       = SabisuRails::VERSION.dup
  spec.authors       = ["Abraham Kuri"]
  spec.email         = ["kurenn@icalialabs.com"]
  spec.summary       = %q{Smart API Explorer}
  spec.description   = %q{A smart api explorer for a rails app}
  spec.homepage      = "https://github.com/IcaliaLabs/sabisu-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.rubyforge_project = "sabisu_rails"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "rspec"

  spec.add_dependency "activemodel"
  spec.add_dependency "actionpack"
  spec.add_dependency "httparty"
end

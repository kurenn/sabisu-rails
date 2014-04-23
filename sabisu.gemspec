# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sabisu/version'

Gem::Specification.new do |spec|
  spec.name          = "sabisu"
  spec.version       = Sabisu::VERSION.dup
  spec.authors       = ["Abraham Kuri"]
  spec.email         = ["kurenn@icalialabs.com"]
  spec.summary       = %q{Smart API Explorer}
  spec.description   = %q{A smart api explorer for a rails app}
  spec.homepage      = "https://github.com/IcaliaLabs/sabisu"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.rubyforge_project = "sabisu"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "activemodel", '~> 4.0'
  spec.add_dependency "actionpack", '~> 4.0'
end

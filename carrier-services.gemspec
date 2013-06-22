# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrier_services/version'

Gem::Specification.new do |spec|
  spec.name          = "carrier-services"
  spec.version       = CarrierServices::VERSION
  spec.authors       = ["David Rubin"]
  spec.email         = ["davidrub@gmail.com.com"]
  spec.description   = %q{Allows you to interact with your carrier via ruby. Often handling the page scraping an all the other nasty}
  spec.summary       = %q{Allows you to interact with your carrier via ruby.Often handling the page scraping an all the other nasty}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mechanize", "~> 2.7.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

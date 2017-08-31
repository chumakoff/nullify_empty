# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nullify_empty/version"

Gem::Specification.new do |spec|
  spec.name          = "nullify_empty"
  spec.version       = NullifyEmpty::VERSION
  spec.authors       = ["Anton Chumakov"]
  spec.email         = ["anton@chumakoff.com"]

  spec.summary       = "Store empty values as NULL in DB."
  spec.description   = "This gem allows to ensure there are no empty strings in DB, but nulls."
  spec.homepage      = "https://github.com/chumakoff/nullify_empty"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

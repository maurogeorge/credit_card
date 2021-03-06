# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'credit_card/version'

Gem::Specification.new do |spec|
  spec.name          = "credit_card"
  spec.version       = CreditCard::VERSION
  spec.authors       = ["Mauro George"]
  spec.email         = ["maurogot@gmail.com"]
  spec.summary       = %q{Provides a interface to inquire if an credit card number
                          is valid or invalid and what is the credit card brand.}
  spec.homepage      = "https://github.com/maurogeorge/credit_card"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.1"
  spec.add_development_dependency "pry"
end

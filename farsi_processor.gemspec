# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'farsi_processor/version'

Gem::Specification.new do |spec|
  spec.name          = "farsi_processor"
  spec.version       = FarsiProcessor::VERSION
  spec.authors       = ["mark jad"]
  spec.email         = ["mark.jad@live.com"]

  spec.summary       = %q{farsi_processor is a Ruby gem to process (stem and normalize) persian/farsi text}
  spec.description   = %q{farsi_processor is a Ruby gem to process (stem and normalize) persian/farsi text}
  spec.homepage      = "https://github.com/mshka/farsi_processor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

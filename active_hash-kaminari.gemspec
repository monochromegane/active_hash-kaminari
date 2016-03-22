# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_hash/kaminari/version'

Gem::Specification.new do |spec|
  spec.name          = "active_hash-kaminari"
  spec.version       = ActiveHash::Kaminari::VERSION
  spec.authors       = ["monochromegane"]
  spec.email         = ["dev.kuro.obi@gmail.com"]

  spec.summary       = %q{Use kaminari paginator with ActiveHash.}
  spec.description   = %q{Use kaminari paginator with ActiveHash.}
  spec.homepage      = "https://github.com/monochromegane/active_hash-kaminari"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "active_hash"
  spec.add_dependency "kaminari"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
end

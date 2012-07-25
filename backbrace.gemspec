# -*- encoding: utf-8 -*-
require File.expand_path('../lib/backbrace/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kevin Horst"]
  gem.email         = ["backbrace@totallyinto.me"]
  gem.description   = %q{}
  gem.summary       = %q{Sets up Backbone.js and Crossroads.js and a basic folder structure}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "backbrace"
  gem.require_paths = ["lib"]
  gem.version       = Backbrace::VERSION
end

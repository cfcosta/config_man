# -*- encoding: utf-8 -*-
require File.expand_path('../lib/config_man/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Cainã Costa"]
  gem.email         = ["cainan.costa@gmail.com"]
  gem.description   = %q{Simplifies repetitive work of parsing configuration files}
  gem.summary       = %q{Simplifies repetitive work of parsing configuration files}
  gem.homepage      = "https://github.com/sryche/config_man"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "config_man"
  gem.require_paths = ["lib"]
  gem.version       = ConfigMan::VERSION
end

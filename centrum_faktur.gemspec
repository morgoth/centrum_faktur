# -*- encoding: utf-8 -*-
require File.expand_path("../lib/centrum_faktur/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Wojciech Wnętrzak"]
  gem.email         = ["w.wnetrzak@gmail.com"]
  gem.description   = %q{Ruby client for Centrum Faktur API}
  gem.summary       = %q{Ruby client for Centrum Faktur API}
  gem.homepage      = "https://github.com/morgoth/centrum_faktur"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "centrum_faktur"
  gem.require_paths = ["lib"]
  gem.version       = CentrumFaktur::VERSION

  gem.add_dependency "multi_json", "~> 1.3"
  gem.add_development_dependency "fakeweb"
end

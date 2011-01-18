# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gstock/version"

Gem::Specification.new do |s|
  s.name        = "gstock"
  s.version     = GStock::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Steve Agalloco"]
  s.email       = ["steve.agalloco@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/gstock"
  s.description = %q{A simple API wrapper for google finance stock quotes.}

  s.rubyforge_project = "gstock"

  s.add_development_dependency('bundler', '~> 1.0')
  s.add_development_dependency('rake', '~> 0.8')
  s.add_development_dependency('rspec', '~> 2.4.0')
  s.add_development_dependency('simplecov', '~> 0.3')
  s.add_development_dependency('webmock', '~> 1.6')
  s.add_development_dependency('yard', '~> 0.6')
  s.add_development_dependency('ZenTest', '~> 4.4')

  s.add_runtime_dependency('typhoeus', '~> 0.2')
  s.add_runtime_dependency('nokogiri', '~> 1.4.4')
  s.add_runtime_dependency('hashie', '~> 0.4.0')
  s.add_runtime_dependency('faraday', '~> 0.5.3')
  s.add_runtime_dependency('faraday_middleware', '~> 0.3.1')
  s.add_runtime_dependency('multi_xml', '~> 0.2.0')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

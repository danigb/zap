# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "zap/version"

Gem::Specification.new do |s|
  s.name        = "zap"
  s.version     = Zap::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["danigb"]
  s.email       = ["danigb@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Application scaffolding}
  s.description = %q{A Rails Engine prepared with all the stuff I need to create projects}

  s.rubyforge_project = "zap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'rails', '>= 3.0.0'
  s.add_dependency 'fog', '>= 0.4.0'
  s.add_dependency 'carrierwave', '>= 0.5.1'
  #s.add_dependency 'inherited_resources', '>= 1.1.2'
  s.add_dependency 'simple_form', '>= 1.3.0'
  s.add_dependency 'responders', '>= 0.6.2'
  s.add_dependency 'omniauth', '>= 0.1.6'
  #s.add_dependency 'sentient_user', '>= 0.3.2'
  #s.add_dependency 'simple_audit', '>= 0.1.1'
end

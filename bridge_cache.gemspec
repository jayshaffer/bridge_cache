$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bridge_cache/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bridge_cache"
  s.version     = BridgeCache::VERSION
  s.authors     = ["jshaffer"]
  s.email       = ["jshaffer@instructure.com"]
  s.homepage    = "https://www.getbridge.com"
  s.summary     = "A mountable engine for bridge data storage"
  s.description = "A mountable engine for bridge data storage"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", '~> 5.0'
  s.add_dependency "bridge_blueprint", '~> 0.0'

  s.add_development_dependency 'actionmailer', '>= 0'
  s.add_development_dependency 'byebug', '>= 0'
  s.add_development_dependency 'actionpack', '>= 0'
  s.add_development_dependency "rspec-rails", ">= 0"
  s.add_development_dependency "factory_girl_rails", ">= 0"
  s.add_development_dependency 'combustion', '>= 0'
  s.add_development_dependency 'bundler', '>= 0'
  s.add_development_dependency 'database_cleaner', '>= 0'
  s.add_development_dependency 'pg', '>= 0'
end

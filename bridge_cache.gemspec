$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'bridge_cache/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'bridge_cache'
  s.version     = BridgeCache::VERSION
  s.authors     = ['jshaffer']
  s.email       = ['jshaffer@instructure.com']
  s.homepage    = 'https://www.getbridge.com'
  s.summary     = 'A mountable engine for bridge data storage'
  s.description = "A mountable engine for bridge data storage,
                  can either be used for direct database connection
                  or as a localized data storage mechanism"
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'activerecord-import', '~> 0.20.2'
  s.add_dependency 'bridge_blueprint', '~> 0.0.06'
  s.add_dependency 'rails', '~> 5.0'
  s.add_runtime_dependency 'rein', '~> 3.4', '~> 3.4.0'

  s.add_development_dependency 'actionmailer', '~> 5.1', '>= 5.1.4'
  s.add_development_dependency 'actionpack', '~> 5.1', '>= 5.1.4'
  s.add_development_dependency 'bundler', '~> 1.6', '>= 1.6.2'
  s.add_development_dependency 'byebug', '~> 9.1', '>= 9.1.0'
  s.add_development_dependency 'combustion', '~> 0.7', '>= 0.7.0'
  s.add_development_dependency 'database_cleaner', '~> 1.6', '>= 1.6.2'
  s.add_development_dependency 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  s.add_development_dependency 'pg', '~> 0.21', '>= 0.21.0'
  s.add_development_dependency 'rspec-rails', '~> 3.7', '>= 3.7.2'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end

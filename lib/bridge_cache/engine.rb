module BridgeCache
  class Engine < ::Rails::Engine
    isolate_namespace BridgeCache

    config.autoload_once_paths += Dir["#{config.root}/lib/**/"]

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
        # Apartment will modify this, but it doesn't fully support engine migrations, so we'll reset it here
        ActiveRecord::Migrator.migrations_paths = Rails.application.paths['db/migrate'].to_a
      end
    end
  end
end

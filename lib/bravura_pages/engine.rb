module BravuraPages
  class Engine < ::Rails::Engine
    isolate_namespace BravuraPages

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: "spec/factories"
    end

    config.autoload_paths << File.expand_path("#{root}/app/models")
    config.autoload_paths << File.expand_path("#{root}/app/controllers")
    config.autoload_paths << File.expand_path("#{root}/app/helpers")

    initializer "bravura_pages.set_account_class" do |app|
      BravuraPages.setup do |config|
        config.account_class = "Account"
      end
    end

    initializer "bravura_pages.action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        helper Rails.application.helpers
      end
    end

    initializer "bravura_pages.assets.precompile" do |app|
      app.config.assets.precompile += %w[ bravura_pages/application.css bravura_pages/application.js ]
    end

    initializer "bravura_pages.friendly_id" do
      require "friendly_id"
    end
  end
end

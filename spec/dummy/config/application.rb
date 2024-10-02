# spec/dummy/config/application.rb
require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require "bravura_pages"

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f

    # For compatibility with applications that use this config
    config.action_controller.include_all_helpers = false

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Add configurations for your engine
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

    # Enable zeitwerk mode
    config.autoloader = :zeitwerk

    # Configure ActionMailer
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

    # Add engine-specific configurations here
    config.bravura_pages = ActiveSupport::OrderedOptions.new
    config.bravura_pages.some_option = 'some value'

    # Load engine-specific initializers
    initializer 'bravura_pages.load_engine_initializers' do
      Dir["#{BravuraPages::Engine.root}/config/initializers/**/*.rb"].each do |initializer|
        load(initializer)
      end
    end
  end
end

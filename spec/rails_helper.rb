# spec/rails_helper.rb
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'factory_bot_rails'
require 'faker'
require 'database_cleaner/active_record'
require 'shoulda-matchers'

# Require support files
Dir[BravuraPages::Engine.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Reset ActsAsTenant after each test
  config.after(:each) do
    ActsAsTenant.current_tenant = nil
  end

  # Include the stub_model helper
  config.extend StubModels
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# Configure FactoryBot
FactoryBot.definition_file_paths = [ BravuraPages::Engine.root.join('spec', 'factories') ]
FactoryBot.reload

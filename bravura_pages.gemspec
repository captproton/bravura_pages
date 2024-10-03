require_relative "lib/bravura_pages/version"

Gem::Specification.new do |spec|
  spec.name        = "bravura_pages"
  spec.version     = BravuraPages::VERSION
  spec.authors     = ["captproton"]
  spec.email       = ["carl@wdwhub.net"]
  spec.homepage    = "https://github.com/captproton/bravura_pages"
  spec.summary     = "A Rails engine for managing static pages."
  spec.description = "BravuraPages is a Rails engine that allows users to create and manage static pages within their Rails application."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/captproton/bravura_pages"
  spec.metadata["changelog_uri"] = "https://github.com/captproton/bravura_pages/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.0"
  spec.add_dependency "acts_as_tenant", "~> 1.0.1"
  spec.add_dependency "pg"
  # spec.add_dependency "friendly_id", "~> 5.4"

  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "factory_bot_rails"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "database_cleaner-active_record"
  spec.add_development_dependency "shoulda-matchers"
end

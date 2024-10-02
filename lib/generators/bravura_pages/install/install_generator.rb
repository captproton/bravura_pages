# lib/generators/bravura_pages/install/install_generator.rb
module BravuraPages
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def copy_initializer
        template "initializer.rb", "config/initializers/bravura_pages.rb"
      end

      def add_routes
        route 'mount BravuraPages::Engine, at: "/bravura_pages"'
      end

      def copy_migrations
        rake "bravura_pages:install:migrations"
      end

      def add_bravura_pages_to_model
        inject_into_file "app/models/account.rb", after: "class Account < ApplicationRecord\n" do
          "  has_many :static_pages, class_name: 'BravuraPages::StaticPage'\n"
        end
      end
    end
  end
end

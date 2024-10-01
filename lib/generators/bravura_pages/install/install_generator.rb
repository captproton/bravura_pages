module BravuraPages
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def copy_initializer
        template "initializer.rb", "config/initializers/bravura_pages.rb"
      end

      def add_routes
        route 'mount BravuraPages::Engine => "/static_pages", as: "static_pages"'
      end
    end
  end
end

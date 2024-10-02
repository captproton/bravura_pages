# app/controllers/bravura_pages/application_controller.rb
module BravuraPages
  class ApplicationController < ::ApplicationController
    # Any engine-specific controller logic can go here
    layout "application"
    helper BravuraPages::Engine.routes.url_helpers
  end
end

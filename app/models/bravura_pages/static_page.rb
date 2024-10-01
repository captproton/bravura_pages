# app/models/bravura_pages/static_page.rb
require "friendly_id"

module BravuraPages
  class StaticPage < ApplicationRecord
    extend FriendlyId
    acts_as_tenant(:account)

    friendly_id :title, use: :scoped, scope: :account

    validates :title, presence: true
    validates :content, presence: true

    # Remove the custom slug generation as friendly_id will handle this
    # before_validation :generate_slug, if: -> { slug.blank? && title.present? }

    private

    def should_generate_new_friendly_id?
      title_changed? || super
    end
  end
end

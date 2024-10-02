# app/models/bravura_pages/static_page.rb
require "acts_as_tenant"

module BravuraPages
  class StaticPage < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: [ :slugged, :scoped ], scope: :account

    acts_as_tenant(:account)
    belongs_to :account
    belongs_to :author, class_name: "User"

    validates :title, presence: true
    validates :content, presence: true

    scope :published, -> { where.not(published_at: nil).where("published_at <= ?", Time.current) }
    scope :draft, -> { where(published_at: nil) }

    def published?
      published_at.present? && published_at <= Time.current
    end

    def publish
      update(published_at: Time.current) unless published?
    end

    def unpublish
      update(published_at: nil) if published?
    end

    def author_name
      author.name
    end

    # If you want to generate a new slug when the title changes
    def should_generate_new_friendly_id?
      title_changed? || super
    end

    # Normalize the slug
    def normalize_friendly_id(string)
      super.gsub("-", "_")
    end
  end
end

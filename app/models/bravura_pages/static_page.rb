require "acts_as_tenant"

module BravuraPages
  class StaticPage < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    acts_as_tenant(:account)
    belongs_to :account
    belongs_to :author, class_name: "User"

    validates :title, presence: true
    validates :content, presence: true
    validates :slug, presence: true, uniqueness: { scope: :account_id }

    scope :published, -> { where("published_at <= ?", Time.current) }

    def publish
      update(published_at: Time.current)
    end

    def published?
      published_at.present? && published_at <= Time.current
    end

    private

    def generate_slug
      self.slug = title.to_s.parameterize
    end
  end
end

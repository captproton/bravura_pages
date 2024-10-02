# app/models/bravura_pages/palo.rb
module BravuraPages
  class Palo < ApplicationRecord
    acts_as_tenant(:account)

    belongs_to :account
    belongs_to :author, class_name: "User"

    validates :title, presence: true
    validates :content, presence: true
    validates :slug, presence: true, uniqueness: { scope: :account_id }

    before_validation :generate_slug, if: -> { slug.blank? }

    private

    def generate_slug
      self.slug = title.to_s.parameterize
    end
  end
end

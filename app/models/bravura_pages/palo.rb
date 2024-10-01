module BravuraPages
  class Palo < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :slug, presence: true, uniqueness: true

    before_validation :generate_slug, if: -> { slug.blank? }

    private

    def generate_slug
      self.slug = title.to_s.parameterize
    end
  end
end

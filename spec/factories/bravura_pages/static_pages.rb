# spec/factories/bravura_pages/static_pages.rb
FactoryBot.define do
  factory :bravura_pages_static_page, class: 'BravuraPages::StaticPage' do
    association :account
    association :author
    sequence(:title) { |n| "#{Faker::Book.title} #{n}" }
    content { Faker::Lorem.paragraphs(number: 3).join("\n\n") }

    trait :published do
      published_at { Time.current }
    end

    trait :draft do
      published_at { nil }
    end
  end
end

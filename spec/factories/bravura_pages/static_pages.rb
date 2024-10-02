FactoryBot.define do
  factory :static_page do
    account { nil }
    title { "MyString" }
    content { "MyText" }
  end
end

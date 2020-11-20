FactoryBot.define do
  factory :review do
    title { "MyString" }
    content { "MyText" }
    user { nil }
    shop { nil }
  end
end

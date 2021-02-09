FactoryBot.define do
  factory :comment do
    content { "comment content" }
    association :user
    association :review
  end
end

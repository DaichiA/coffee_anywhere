FactoryBot.define do
  factory :notification do
    association :comment
    association :review
    association :visitor
    association :visited
  end
end

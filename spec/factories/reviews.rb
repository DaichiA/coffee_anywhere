FactoryBot.define do
  factory :review do
    title { 'first review' }
    content { 'first content' }
    # user { nil }
    # shop { nil }
    association :user
    association :shop
    created_at { 1.month.ago }
  end

  factory :old_review, class: Review do
    title { 'second review' }
    content { 'second content' }
    created_at { 1.year.ago }
  end

  factory :new_review, class: Review do
    title { 'third review' }
    content { 'third content' }
    created_at { 1.day.ago }
  end
end

FactoryBot.define do
  factory :review do
    title { 'first review' }
    rate { 3 }
    content { 'first content' }
    # user { user }
    # shop { shop }
    association :user
    association :shop
    # created_at { 1.month.ago }
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

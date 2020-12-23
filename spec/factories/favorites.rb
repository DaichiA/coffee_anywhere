FactoryBot.define do
  factory :favorite do
    association :user
    association :shop
    user_id { user.id }
    created_at { 1.month.ago }

    factory :old_favorite do
      created_at { 1.year.ago }
    end

    factory :new_favorite do
      created_at { 1.day.ago }
    end
  end
end

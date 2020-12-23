FactoryBot.define do
  # 値が適切なユーザーuse
  factory :user do
    name { 'factory' }
    sequence(:email) { |n| "factory#{n}@example.com" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/user_image.jpg')) }
    password { 'password' }
    password_confirmation { 'password' }

    trait :admin do
      admin { true }
    end

    trait :with_favs do
      after(:create) { |user| create_list(:favorite, 5, user_id: user.id) }
    end

    trait :with_reviews do
      after(:create) { |user| create_list(:review, 5, user_id: user.id) }
    end
  end

  # adminユーザー
  factory :admin_user, class: User do
    name { 'admin_user' }
    sequence(:email) { |n| "admin#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
  end

  # 値が不適切なユーザー
  factory :user_invalid, class: User do
    name { ' ' }
    email { 'a@example' }
    password { 'wrong' }
    password_confirmation { 'invalid' }
  end

  # 他のユーザー
  factory :other_user, class: User do
    name { 'other_user' }
    sequence(:email) { |n| "otheruser#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

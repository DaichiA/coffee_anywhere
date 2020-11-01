FactoryBot.define do
  #値が適切なユーザー
  factory :user do
    name { "factory" }
    sequence(:email) { |n| "factory#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  #値が不適切なユーザー
  factory :user_invalid, class: User do
    name { " " }
    email { "a@example" }
    password { "wrong" }
    password_confirmation { "invalid" }
  end

end

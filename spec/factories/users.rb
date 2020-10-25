FactoryBot.define do
  factory :user do
    name { "tester" }
    email { "tester@example.com" }

    factory :user_too_long_name do
      name { "a" *31 }
    end

    factory :user_too_long_email do
      email { "a" *243 +"@example.com" }
    end

  end
end

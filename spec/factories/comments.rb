FactoryBot.define do
  factory :comment do
    content { 'comment content' }
    association :user
    association :review

    trait :new_comment do
      content { 'new comment' }
    end
  end

  # 新しいコメント
  # factory :new_comment, class: Comment do
  #   name { 'admin_user' }
  #   sequence(:email) { |n| "admin#{n}@example.com" }
  #   password { 'password' }
  #   password_confirmation { 'password' }
  #   admin { true }
  # end
end

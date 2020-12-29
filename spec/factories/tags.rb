FactoryBot.define do
  factory :tag do
    sequence(:tag_name) { |n| "tag-#{n}"}
    # tag_name { 'first_tag' }
  end

  factory :second_tag, class: Tag do
    tag_name { 'second_tag' }
  end

  factory :third_tag, class: Tag do
    tag_name { 'third_tag' }
  end
end

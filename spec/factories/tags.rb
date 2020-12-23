FactoryBot.define do
  factory :tag do
    tag_name { 'first_tag' }
  end

  factory :second_tag, class: Tag do
    tag_name { 'second_tag' }
  end

  factory :third_tag, class: Tag do
    tag_name { 'third_tag' }
  end
end

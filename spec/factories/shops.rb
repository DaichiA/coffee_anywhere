FactoryBot.define do
  factory :shop do
    name { 'test_shop' }
    # 1桁目が0,全部で10-11桁の数列を生成
    # phone_number { "0#{rand(000_000_001..9_999_999_999)}" }
    phone_number { '0' + format("%0#{9}d", SecureRandom.random_number(10**9)) }
    address { '東京都中央区1丁目１番地' }
    business_hours { '午前9時から午後6時' }
    description { 'お店の説明' }
    dayoff { '日曜日' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/shop_image.jpg')) }

    trait :second do
      name { 'second' }
    end

    trait :third do
      name { 'third' }
    end

    trait :with_tags do
      after(:create) do |shop|
        shop.tags << FactoryBot.create(:tag)
      end
    end

    trait :with_reviews do
      after(:create) { |shop| create_list(:review, 2, shop: shop) }
    end
  end

  factory :second_shop, class: Shop do
    name { 'second_shop' }
    # 1桁目が0,全部で10-11桁の数列を生成
    # phone_number { "0#{rand(000_000_001..9_999_999_999)}" }
    phone_number { '0' + format("%0#{9}d", SecureRandom.random_number(10**9)) }
    address { '東京都中央区2丁目2番地' }
    business_hours { '午前9時から午後6時' }
    description { '2軒目の説明' }
    dayoff { '土曜日' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/second_shop_image.jpg')) }

    trait :with_tags do
      after(:create) do |shop|
        shop.tags << FactoryBot.create(:tag)
        shop.tags << FactoryBot.create(:second_tag)
      end
    end
  end

  factory :third_shop, class: Shop do
    name { 'third_shop' }
    # 1桁目が0,全部で10-11桁の数列を生成
    # phone_number { "0#{rand(000_000_001..9_999_999_999)}" }
    phone_number { '0' + format("%0#{9}d", SecureRandom.random_number(10**9)) }
    address { '大阪府中央区3丁目3番地' }
    business_hours { '午前9時から午後6時' }
    description { '3軒目の説明' }
    dayoff { '金曜日' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/third_shop_image.jpg')) }

    trait :with_tags do
      after(:create) do |shop|
        shop.tags << FactoryBot.create(:tag)
        shop.tags << FactoryBot.create(:second_tag)
        shop.tags << FactoryBot.create(:third_tag)
      end
    end
  end

  factory :fourth_shop, class: Shop do
    name { 'fourth_shop' }
    # 1桁目が0,全部で10-11桁の数列を生成
    # phone_number { "0#{rand(000_000_001..9_999_999_999)}" }
    phone_number { '0' + format("%0#{9}d", SecureRandom.random_number(10**9)) }
    address { '大阪府中央区4丁目4番地' }
    business_hours { '午前10時から午後7時' }
    description { '4軒目の説明' }
    dayoff { '金曜日' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/fourth_shop_image.jpg')) }
  end

  factory :fifth_shop, class: Shop do
    name { 'fifth_shop' }
    # 1桁目が0,全部で10-11桁の数列を生成
    # phone_number { "0#{rand(000_000_001..9_999_999_999)}" }
    phone_number { '0' + format("%0#{9}d", SecureRandom.random_number(10**9)) }
    address { '大阪府中央区5丁目5番地' }
    business_hours { '午前8時から午後11時' }
    description { '5軒目の説明' }
    dayoff { '金曜日' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/fifth_shop_image.jpg')) }
  end
end

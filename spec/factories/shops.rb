FactoryBot.define do
  factory :shop do
    name { "test_shop" }
    # 1桁目が0,全部で10-11桁の数列を生成
    phone_number { "0#{rand(000000001..9999999999)}" }
    address { "東京都中央区1丁目１番池" }
    business_hours { "午前9時から午後6時" }
    description { "お店の説明" }
  end
end

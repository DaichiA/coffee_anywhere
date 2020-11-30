# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Example User",
              email: "example@example.com",
              password: "password",
              password_confirmation: "password",
              admin:true)

# User.create!(name: "Second User",
#               email: "second@example.com",
#               password: "password",
#               password_confirmation: "password")

30.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password)
end

# 35.times do |n|
#   name = Faker::Restaurant.name 
#   address = Faker::Address.full_address
#   phone_number = "000000000#{n}"
#   Shop.create!(name: name,
#                 address: address,
#                 phone_number: phone_number,
#                 business_hours: "9:00 ~ 18:00",
#                 dayoff: "月曜日、木曜日",
#                 description: "親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）")
# end

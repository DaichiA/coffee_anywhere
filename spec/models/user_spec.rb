require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(
      name: "Example User",
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  it "is valid with name, email and password" do
    @user.name = "a"*30
    @user.email = "a" *243 +"@example.com"
    @user.password = "a" *8
    @user.password_confirmation = "a" *8
    expect(@user).to be_valid
  end

  it "is invalid without name, email, password and password_confirmation" do
    user = User.new
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
    expect(user.errors[:email]).to include("を入力してください")
    expect(user.errors[:password]).to include("は8文字以上で入力してください")
    expect(user.errors[:password_confirmation]).to include("を入力してください")
  end

  it "is invalid with too long name and email and too short password" do
    @user.name = "a"*31
    @user.email = "a" *244 +"@example.com"
    @user.password = "a" *5
    @user.password_confirmation = "a" *5
    @user.valid?
    expect(@user.errors[:name]).to include("は30文字以内で入力してください")
    expect(@user.errors[:email]).to include("は255文字以内で入力してください")
    expect(@user.errors[:password]).to include("は8文字以上で入力してください")
  end

  it "is acceptable with valid email" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
      end
  end

  it "is not acceptable with invalid email" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to_not be_valid
    end
  end

  it "is invalid with duplicate email" do
    user = User.create(
      name: "tester",
      email: "test@example.com"
    )
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    expect(duplicate_user).to_not be_valid
  end

end

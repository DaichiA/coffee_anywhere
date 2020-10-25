require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(
      name: "Example User",
      email: "user@example.com"
    )
  end

  it "is valid with name and email" do
    @user.name = "a"*30
    @user.email = "a" *243 +"@example.com"
    expect(@user).to be_valid
  end

  it "is invalid without name" do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it "is invalid without email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it "is invalid with too long name and email" do
    @user.name = "a"*31
    @user.email = "a" *244 +"@example.com"
    @user.valid?
    expect(@user.errors[:name]).to include("is too long (maximum is 30 characters)")
    expect(@user.errors[:email]).to include("is too long (maximum is 255 characters)")
  end

  it "is acceptable with valid email" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      expect( user = User.new(
          name: "tester",
          email: valid_address
          )).to be_valid
      end
  end

  it "is not acceptable with invalid email" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      expect( user = User.new(
        name: "tester",
        email: invalid_address
        )).to_not be_valid
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

require 'rails_helper'

RSpec.describe Shop, type: :model do
  
  it "has a valid factory" do
    expect(FactoryBot.build(:shop)).to be_valid
  end

  context "name" do
    it "is invalid without name" do
      shop = Shop.new(name: nil)
      shop.valid?
      expect(shop.errors[:name]).to include("を入力してください")
    end
    
    it "is invalid with too long name" do
      shop = Shop.new(name: "a"*31)
      shop.valid?
      expect(shop.errors[:name]).to include("は30文字以内で入力してください")
    end
  end


  context "address" do
    it "is invalid without address" do
      shop = Shop.new(address: nil)
      shop.valid?
      expect(shop.errors[:address]).to include("を入力してください")
    end
  
  
    it "is invalid with too long address" do
      shop = Shop.new(address: "a"*256)
      shop.valid?
      expect(shop.errors[:address]).to include("は255文字以内で入力してください")
    end
  end


  context "phone_number" do
    VALID_PHONE_NUMBER_REGEX = /\A0\d{9,10}\z/

    it "is invalid without phone_number" do
      shop = Shop.new(phone_number: nil)
      shop.valid?
      expect(shop.errors[:phone_number]).to include("は不正な値です")
    end

    it "is acceptable with valid phone number" do
      shop = FactoryBot.build(:shop)
      expect(shop.phone_number).to match(VALID_PHONE_NUMBER_REGEX)
    end
  end


  context "description" do
    it "is invalid with too long description" do
      shop = Shop.new(description: "a"*601)
      shop.valid?
      expect(shop.errors[:description]).to include("は600文字以内で入力してください")
    end
  end





end

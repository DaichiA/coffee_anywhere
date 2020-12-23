require 'rails_helper'

VALID_PHONE_NUMBER_REGEX = /\A0\d{9,10}\z/

RSpec.describe Shop, type: :model do
  context 'valid information' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:shop)).to be_valid
    end

    it 'is valid without image, tags, phone_number, business_hours and description' do
      shop = Shop.new(name: 'second shop',
                      address: '東京都中央区二丁目二番地',
                      dayoff: '日曜日')
      expect(shop).to be_valid
    end
  end

  context 'name' do
    it 'is invalid without name' do
      shop = Shop.new(name: nil)
      shop.valid?
      expect(shop.errors[:name]).to include('を入力してください')
    end

    it 'is invalid with too long name' do
      shop = Shop.new(name: 'a' * 31)
      shop.valid?
      expect(shop.errors[:name]).to include('は20文字以内で入力してください')
    end
  end

  context 'address' do
    it 'is invalid without address' do
      shop = Shop.new(address: nil)
      shop.valid?
      expect(shop.errors[:address]).to include('を入力してください')
    end

    it 'is invalid with too long address' do
      shop = Shop.new(address: 'a' * 101)
      shop.valid?
      expect(shop.errors[:address]).to include('は100文字以内で入力してください')
    end
  end

  context 'phone_number' do
    it 'is acceptable with valid phone number' do
      shop = FactoryBot.build(:shop)
      expect(shop.phone_number).to match(VALID_PHONE_NUMBER_REGEX)
    end

    it 'is not acceptable with invalid phone number' do
      shop = Shop.new(phone_number: '333')
      shop.valid?
      expect(shop.errors[:phone_number]).to include('は不正な値です')
    end
  end

  context 'description' do
    it 'is invalid with too long description' do
      shop = Shop.new(description: 'a' * 601)
      shop.valid?
      expect(shop.errors[:description]).to include('は600文字以内で入力してください')
    end
  end

  context 'business hours' do
    it 'is invalid with too long business hours' do
      shop = Shop.new(business_hours: 'a' * 31)
      shop.valid?
      expect(shop.errors[:business_hours]).to include('は30文字以内で入力してください')
    end
  end

  context 'day off' do
    it 'is invalid without day off' do
      shop = Shop.new(dayoff: nil)
      shop.valid?
      expect(shop.errors[:dayoff]).to include('を入力してください')
    end

    it 'is invalid with too long dayoff' do
      shop = Shop.new(dayoff: 'a' * 21)
      shop.valid?
      expect(shop.errors[:dayoff]).to include('は20文字以内で入力してください')
    end
  end

  context 'image' do
    let(:shop) { FactoryBot.build(:shop) }
    it 'is valid with jpg image' do
      shop.image = Rack::Test::UploadedFile.new(File.join(Rails.root, '/spec/factories/images/test.jpg'))
      expect(shop).to be_valid
    end

    it 'is valid with gif image' do
      shop.image = Rack::Test::UploadedFile.new(File.join(Rails.root, '/spec/factories/images/test.gif'))
      expect(shop).to be_valid
    end

    it 'is valid with png image' do
      shop.image = Rack::Test::UploadedFile.new(File.join(Rails.root, '/spec/factories/images/test.png'))
      expect(shop).to be_valid
    end

    it 'is invalid with too big image' do
      shop.image = Rack::Test::UploadedFile.new(File.join(Rails.root, '/spec/factories/images/too_big_test_image.jpg'))
      expect(shop).to_not be_valid
    end
  end

  context 'save_tag method' do
    it 'update tags' do
      shop = FactoryBot.create(:shop)
      tag1 = shop.tags.create(tag_name: 'shop_tag1')
      tag2 = shop.tags.create(tag_name: 'shop_tag2')
      expect(shop.tags).to eq [tag1, tag2]

      tag3 = Tag.create(tag_name: 'shop_tag3')
      tag4 = Tag.create(tag_name: 'shop_tag4')
      tag_list = [tag3.tag_name, tag4.tag_name]

      shop.save_tag(tag_list)

      expect(shop.tags).to eq [tag3, tag4]
    end
  end
end

require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { FactoryBot.create(:review) }
  
  describe 'validation' do
    it 'has valid factory' do
      expect(FactoryBot.create(:review)).to be_valid
    end

    context 'title' do
      it 'is invalid without title' do
        review.title = nil
        review.valid?
        expect(review.errors[:title]).to include('を入力してください')
      end

      it 'is invalid with too long title' do
        review.title = 'a' * 21
        review.valid?
        expect(review.errors[:title]).to include('は20文字以内で入力してください')
      end
    end

    context 'content' do
      it 'is invalid without content' do
        review.content = nil
        review.valid?
        expect(review.errors[:content]).to include('を入力してください')
      end

      it 'is invalid with too long content' do
        review.content = 'a' * 301
        review.valid?
        expect(review.errors[:content]).to include('は300文字以内で入力してください')
      end
    end
  end

  describe 'order' do
    it 'comes most recent review first' do
      user = FactoryBot.create(:user)
      shop1 = FactoryBot.create(:shop)
      shop2 = FactoryBot.create(:shop, :second)
      shop3 = FactoryBot.create(:shop, :third)

      review1 = user.reviews.create(shop: shop1, title: 'title', content: 'content', rate: 3)
      review2 = user.reviews.create(shop: shop2, title: 'title', content: 'content', rate: 3)
      review3 = user.reviews.create(shop: shop3, title: 'title', content: 'content', rate: 3)
      expect(user.reviews.first).to eq review3
    end
  end
end

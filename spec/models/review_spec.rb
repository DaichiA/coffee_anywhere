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
      review1 = FactoryBot.create(:review)
      review2 = FactoryBot.create(:review, user: review1.user)
      review3 = FactoryBot.create(:review, user: review1.user)
      expect(review3).to eq Review.first
    end
  end
end

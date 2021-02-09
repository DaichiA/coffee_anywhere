require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    it 'has valid factory' do
      
    end

    context 'title' do
      it 'is invalid without content' do
        comment.
        review.valid?
        expect(review.errors[:title]).to include('を入力してください')
      end
end

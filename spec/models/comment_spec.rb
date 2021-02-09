require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.create(:comment) }
  let(:new_comment) { FactoryBot.create(:comment, :new_comment) }

  it 'has valid factory' do
    expect(FactoryBot.create(:comment)).to be_valid
  end

  it 'is valid with content' do
    comment.content = 'good content'
    expect(comment).to be_valid
  end

  it 'is invalid without content' do
    comment.content = ''
    expect(comment).to_not be_valid
  end

  it 'is invalid too long content' do
    comment.content = 'a'*101
    expect(comment).to_not be_valid
    end

  it 'is descending order' do
    comment.content = 'old comment'
    comment.save
    new_comment.content = 'new comment'
    new_comment.save
    expect(Comment.first.content).to eq 'new comment'
  end

end

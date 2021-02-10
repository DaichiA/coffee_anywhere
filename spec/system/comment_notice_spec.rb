require 'rails_helper'

RSpec.describe 'comment', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:second_user) { FactoryBot.create(:other_user) }
  let(:third_user) { FactoryBot.create(:third_user) }
  let(:shop) { FactoryBot.create(:shop) }
  let!(:review) { FactoryBot.create(:review, shop: shop, user: user) }

  subject { page }

  it 'comments and the reviewer gets notice' do
    # 他者コメント時にレビュー投稿者に通知
    login(user)
    is_expected.to_not have_selector '.notice' # 最初は通知なし
    click_link '通知'
    is_expected.to have_content '通知はありません'
    click_link 'ログアウト'
    login(second_user)
    visit root_path
    fill_in 'キーワードでお店を検索', with: shop.name
    find('.btn-warning').click
    click_link shop.name
    within all('.my_review')[0] do
      is_expected.to have_content review.title
      fill_in 'コメントする', with: 'first comment'
      expect do
        click_button '送信'
      end.to change(Comment, :count).by(1)
    end
    is_expected.to have_content 'first comment'
    click_link 'ログアウト'
    login(user)
    is_expected.to have_selector '.notice' # 通知来てる
    click_link '通知'
    is_expected.to have_content second_user.name
    is_expected.to have_link shop.name
    is_expected.to have_content 'first comment'
    click_link 'ログアウト'

    # コメント投稿時に他コメント投稿者に通知
    login(third_user)
    visit root_path
    fill_in 'キーワードでお店を検索', with: shop.name
    find('.btn-warning').click
    click_link shop.name
    within all('.my_review')[0] do
      is_expected.to have_content review.title
      is_expected.to have_content 'first comment'
      fill_in 'コメントする', with: 'second comment'
      expect do
        click_button '送信'
      end.to change(Comment, :count).by(1)
    end
    is_expected.to have_content 'second comment'
    click_link 'ログアウト'
    login(second_user)
    is_expected.to have_selector '.notice' # 通知来てる
    click_link '通知'
    is_expected.to have_content third_user.name
    is_expected.to have_link shop.name
    is_expected.to have_content 'second comment'
    click_link 'ログアウト'

    # 自分の投稿にコメントしても通知はこない
    login(user)
    is_expected.to have_selector '.notice' # third_userコメントの通知
    click_link '通知'
    is_expected.to have_content third_user.name
    is_expected.to have_link shop.name
    is_expected.to have_content 'second comment'
    visit root_path
    fill_in 'キーワードでお店を検索', with: shop.name
    find('.btn-warning').click
    click_link shop.name
    within all('.my_review')[0] do
      is_expected.to have_content review.title
      is_expected.to have_content 'first comment'
      is_expected.to have_content 'second comment'
      fill_in 'コメントする', with: 'self comment'
      expect do
        click_button '送信'
      end.to change(Comment, :count).by(1)
    end
    is_expected.to have_content 'self comment'
    is_expected.to_not have_selector '.notice' # 通知なし
    click_link '通知'
    is_expected.to_not have_content 'self comment'
  end
end

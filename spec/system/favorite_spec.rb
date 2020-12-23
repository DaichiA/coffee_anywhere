require 'rails_helper'

RSpec.describe 'favorite', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:other_user) }
  let!(:shop) { FactoryBot.create(:shop) }

  subject { page }
  context 'as a guest user' do
    # ログインしないとブックマークできない
    it 'can not bookmark' do
      visit root_path
      fill_in 'キーワードでお店を検索', with: shop.name
      find('.btn-warning').click
      click_link shop.name
      is_expected.to_not have_selector '#fav'
    end
  end

  context 'as a login user' do
    # ログインしてブックマーク
    it 'can bookmark', js: true do
      login(user)
      visit root_path
      fill_in 'キーワードでお店を検索', with: shop.name
      find('.btn-warning').click
      click_link shop.name
      within '#show_fav' do
        is_expected.to_not have_selector '.text-warning'
      end
      expect {
        find('#fav').click
        is_expected.to have_selector '.text-warning'
      }.to change(user.favorites, :count).by(1)
      # マイページにも追加されている
      find('.dropdown-toggle').click
      click_link 'マイページ'
      is_expected.to have_link shop.name
      is_expected.to have_content shop.dayoff
      is_expected.to have_link shop.description
      # それを消す
      click_link shop.name
      within '#show_fav' do
        is_expected.to have_selector '.text-warning'
      end
      expect {
        find('#fav').click
        is_expected.to_not have_selector '.text-warning'
      }.to change(user.favorites, :count).by(-1)
      # マイページから消えている
      find('.dropdown-toggle').click
      click_link 'マイページ'
      is_expected.to_not have_link shop.name
      is_expected.to_not have_content shop.dayoff
      is_expected.to_not have_link shop.description
      is_expected.to have_selector('p', text: 'まだ店をブックマークしていません')
    end
  end
end

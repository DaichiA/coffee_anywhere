require 'rails_helper'

RSpec.describe 'admin', type: :system do
  let(:user) { FactoryBot.create(:user, :admin) }
  let!(:shop) { FactoryBot.create(:shop, :with_tags) }

  before do
    login(user)
  end

  subject { page }
  it 'login as an admin user' do
    visit root_path
    is_expected.to have_link 'Home'
    is_expected.to have_link '店舗 新規登録'
    is_expected.to have_link '店舗 一覧'
    is_expected.to have_link 'ユーザー一覧'
    is_expected.to have_link 'マイページ'
    is_expected.to have_link 'ログアウト'
  end

  describe 'shops' do
    describe 'register a shop' do
      it 'with valid informtion' do
        visit root_path
        click_link '店舗 新規登録'
        fill_in '店名', with: 'test shop'
        attach_file 'shop_image', "#{Rails.root}/spec/factories/images/shop_image.jpg"
        fill_in 'tags', with: 'test tag'
        fill_in 'shop[address]', with: 'test address' # なぜか「住所」では通らない
        fill_in '電話番号', with: '01234567890'
        fill_in '営業時間', with: 'test hours'
        fill_in '定休日', with: 'test days'
        fill_in '説明', with: 'test description'
        expect {
          click_button '登録'
        }.to change(Shop, :count).by(1)
      end

      it 'without name, address and dayoff' do
        visit root_path
        click_link '店舗 新規登録'
        attach_file 'shop_image', "#{Rails.root}/spec/factories/images/shop_image.jpg"
        fill_in 'tags', with: 'test tag'
        fill_in '電話番号', with: '01234567890'
        fill_in '営業時間', with: 'test hours'
        fill_in '説明', with: 'test description'
        expect {
          click_button '登録'
        }.to_not change(Shop, :count)
        expect(page).to have_selector('.alert-danger', text: '3箇所のエラーがあります。')
        expect(page).to have_content('店名を入力してください')
        expect(page).to have_content('住所を入力してください')
        expect(page).to have_content('定休日を入力してください')
      end
    end

    describe 'edit a shop' do
      subject { page }
      it 'is filled in all forms' do
        visit root_path
        click_link '店舗 一覧'
        click_link shop.name
        click_link '編集'
        is_expected.to have_field '店名', with: shop.name
        is_expected.to have_field 'shop[address]', with: shop.address
        is_expected.to have_field 'tags', with: shop.tags.pluck(:tag_name).join(',')
        is_expected.to have_field '電話番号', with: shop.phone_number
        is_expected.to have_field '営業時間', with: shop.business_hours
        is_expected.to have_field '定休日', with: shop.dayoff
        is_expected.to have_field '説明', with: shop.description
        fill_in '店名', with: 'テストショップ'
        attach_file '画像', "#{Rails.root}/spec/factories/images/alt_shop_image.jpg"
        fill_in 'tags', with: '新しいタグ'
        fill_in 'shop[address]', with: '新しい住所' # なぜか「住所」では通らない
        fill_in '電話番号', with: '0987654321'
        fill_in '営業時間', with: '新しい営業時間'
        fill_in '定休日', with: '月曜日'
        fill_in '説明', with: '新しい説明'
        click_button '登録'
        expect(current_path).to eq shop_path(shop)
        is_expected.to have_selector('.alert-success', text: '店情報を更新しました。')
        is_expected.to have_selector 'h1', text: 'テストショップ'
        is_expected.to have_selector("img[src$='alt_shop_image.jpg']")
        is_expected.to have_content '新しいタグ'
        is_expected.to have_content '0987654321'
        is_expected.to have_content '新しい営業時間'
        is_expected.to have_content('月曜日', count: 2)
        is_expected.to have_content '新しい説明'
      end
    end

    describe 'destroy' do
      it 'destroy a review' do
      end

      it 'destroy a shop' do
        visit root_path
        click_link '店舗 一覧'
        click_link shop.name
        click_link '編集'
        expect {
          click_on '削除'
        }.to change(Shop, :count).by(-1)
        expect(current_path).to eq shops_path
        expect(page).to have_selector('.alert-success', text: '店舗情報を削除しました。')
      end
    end
  end

  describe 'users' do
    it 'destroy user' do
      other_user = FactoryBot.create(:other_user)
      other_user.update!(
        password: 'password',
        password_confirmation: 'password',
        activation_state: 'active'
      )
      visit root_path
      click_link 'ユーザー一覧'
      expect(page).to have_content other_user.name
      expect {
        click_link '<削除>'
      }.to change(User, :count).by(-1)
      expect(page).to_not have_content other_user.name
    end
  end
end

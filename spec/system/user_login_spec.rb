require 'rails_helper'

RSpec.describe "User login", type: :system do
  let(:user) { FactoryBot.create(:user) }
  
  describe "with valid information followed by logout" do
    before do
      login(user) #モジュールに切り分けた
    end

    it "has a valid factory" do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it "has an admin user factory" do
      admin_user = FactoryBot.build(:user, :admin)
      expect(admin_user.admin).to eq true
    end

    subject { page }
    it "log in" do
      expect(current_path).to eq root_path
      is_expected.to have_selector('.alert-success', text: 'ログインしました。') 
      is_expected.to have_link "Home"
      is_expected.to_not have_link "登録"
      is_expected.to_not have_link "ログイン"
      is_expected.to have_selector('.dropdown-toggle')
      is_expected.to have_link "マイページ"
      is_expected.to have_link "設定"
      is_expected.to have_link "ログアウト"
      # adminメニューも表示されていない
      is_expected.to_not have_link "店舗 新規登録"
      is_expected.to_not have_link "店舗 一覧"
      is_expected.to_not have_link "ユーザー一覧"
    end

    it "log out" do
      find('.dropdown-toggle').click
      click_link "ログアウト"
      is_expected.to have_selector('.alert-success', text: 'ログアウトしました。') 
      is_expected.to have_link "Home"
      is_expected.to have_link "登録"
      is_expected.to have_link "ログイン"
      is_expected.to_not have_selector('.dropdown-toggle')
    end

    
  end

  describe  "with invalid information" do
    
    subject { page }
    it " invalid email" do
      visit login_path
      fill_in "メールアドレス", with: "invalid@com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
      expect(page).to have_selector('.alert-danger', text: 'ログインに失敗しました。') 
      is_expected.to have_link "Home"
      is_expected.to have_link "登録"
      is_expected.to have_link "ログイン"
      is_expected.to_not have_selector('.dropdown-toggle')
    end

    it " invalid password" do
      visit login_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: "invalid_password"
      click_button "ログイン"
      expect(page).to have_selector('.alert-danger', text: 'ログインに失敗しました。') 
      is_expected.to have_link "Home"
      is_expected.to have_link "登録"
      is_expected.to have_link "ログイン"
      is_expected.to_not have_selector('.dropdown-toggle')
    end
  end
    
end

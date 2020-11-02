require 'rails_helper'

RSpec.describe "User login", type: :system do
  let(:user) { FactoryBot.create(:user) }

  describe "with valid information followed by logout" do
    before do
      login(user) #モジュールに切り分けた
    end

    subject { page }
    it "log in" do
      expect(current_path).to eq user_path(user)
      is_expected.to have_selector('.alert-success', text: 'ログインしました。') 
      within ".nav" do
        is_expected.to_not have_content "Sign up"
        is_expected.to_not have_content "Login"
        is_expected.to have_content "Logout"
        is_expected.to have_content "設定"
      end
    end

    it "log out" do
      click_link "Logout"
      is_expected.to have_selector('.alert-success', text: 'ログアウトしました。') 
      within ".nav" do
        is_expected.to have_content "Sign up"
        is_expected.to have_content "Login"
        is_expected.to_not have_content "Logout"
        is_expected.to_not have_content "設定"
      end
    end
  end

  #フレンドリーフォワーディングのテストも書く


  describe  "with invalid information" do
    
    subject { page }
    it " invalid email" do
      visit login_path
      fill_in "メールアドレス", with: "invalid@com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
      expect(page).to have_selector('.alert-danger', text: 'ログインに失敗しました。') 
      within ".nav" do
        is_expected.to have_content "Sign up"
        is_expected.to have_content "Login"
        is_expected.to_not have_content "Logout"
        is_expected.to_not have_content "設定"
      end
    end

    it " invalid password" do
      visit login_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: "invalid_password"
      click_button "ログイン"
      expect(page).to have_selector('.alert-danger', text: 'ログインに失敗しました。') 
      within ".nav" do
        is_expected.to have_content "Sign up"
        is_expected.to have_content "Login"
        is_expected.to_not have_content "Logout"
        is_expected.to_not have_content "設定"
      end
    end
  end

end

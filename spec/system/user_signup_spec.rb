require 'rails_helper'

RSpec.describe "User signup", type: :system do

  example "valid signup information" do
    visit signup_path
    fill_in "名前", with: "Example User"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "password"
    fill_in "パスワード確認", with: "password"
    expect {
      click_button "登録"
    }.to change(User, :count).by(1) 
    expect(current_path).to eq root_path
    expect(page).to have_content "登録が完了しました。"
    #登録と同時にログインしていることをテスト
    within ".nav" do
      expect(page).to_not have_content "Sign up"
      expect(page).to_not have_content "Login"
      expect(page).to have_content "Logout"
      expect(page).to have_content "設定"
    end
  end

  example "invalid signup information" do
    visit signup_path
    fill_in "名前", with: " "
    fill_in "メールアドレス", with: "example.com"
    fill_in "パスワード", with: "pass"
    fill_in "パスワード確認", with: "word"
    expect {
      click_button "登録"
    }.to_not change(User, :count)
    expect(page).to have_content "エラーがあります。"
  end

end
require 'rails_helper'

RSpec.describe "User signup and account activation", type: :system do
  #追記
  before do
    ActionMailer::Base.deliveries.clear
    #↓変数に入れたくて最初にUser.newしてしまうと、そこでユーザーができてしまうことによって下で新規登録しようとしてもバリデーションエラーが発生してしまう。
    # @user = User.new(
    #   name: "Example User",
    #   email: "test@example.com",
    #   password: "password",
    #   password_confirmation: "password"
    # )
  end

  describe "with valid signup information" do
    it "sign up" do
      visit signup_path
      fill_in "名前", with: "Example User"
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "password"
      fill_in "パスワード確認", with: "password"
      expect {
        click_button "登録"
      }.to change(User, :count).by(1) 
      expect(ActionMailer::Base.deliveries.size).to eq(1)
      expect(current_path).to eq root_path
      expect(page).to have_content "メールを送信したのでご確認ください。"
      
      #有効化されてない状態でログインしてみる
      visit login_path
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
      expect(page).to have_selector('.alert-danger', text: 'ログインに失敗しました。')

      #不正なトークン
      visit activate_user_url("invalid_token")
      expect(page).to have_selector('.alert-danger', text: 'URLが間違っています。')
      
      #正しい有効化トークンでログイン 
      visit activate_user_url(User.last.activation_token)
      expect(page).to have_selector('.alert-success', text: 'アクティベートされました') 

      #同時にログインされているか
      expect(page).to have_content "profile"
      expect(page).to have_content "設定"
      expect(page).to have_content "Logout"
      expect(page).to_not have_content "Login"
      expect(page).to_not have_content "Signup"
      
    end


  end

  example "with invalid signup information" do
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
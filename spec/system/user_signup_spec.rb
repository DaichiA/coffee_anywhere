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

  # describe "with valid signup information" do
    it "valid sign up" do
      visit root_path
      click_link "登録"
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
      within ".nav" do
        expect(page).to have_content "マイページ"
        expect(page).to have_content "ログアウト"
        expect(page).to_not have_content "ログイン"
        expect(page).to_not have_content "登録"
      end
    end
    
      


  # end

  it "invalid signup" do
    visit root_path
    click_link "登録"
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
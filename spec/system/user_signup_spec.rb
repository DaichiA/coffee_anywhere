require 'rails_helper'

RSpec.describe 'User signup and account activation', type: :system do
  # 追記
  before do
    ActionMailer::Base.deliveries.clear
  end

  it 'sign up' do
    # 間違った情報で登録
    visit root_path
    click_link '登録'
    fill_in '名前', with: ' '
    fill_in 'メールアドレス', with: 'example.com'
    fill_in 'パスワード', with: 'pass'
    fill_in 'パスワード確認', with: 'word'
    expect {
      click_button '登録'
    }.to_not change(User, :count)
    expect(page).to have_content 'エラーがあります。'

    # 正しく登録
    visit root_path
    click_link '登録'
    fill_in '名前', with: 'Example User'
    # attach_file 'アイコン画像', "#{Rails.root}/spec/factories/images/user_image.jpg"
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード確認', with: 'password'
    expect {
      click_button '登録'
    }.to change(User, :count).by(1)
    expect(ActionMailer::Base.deliveries.size).to eq(1)
    expect(current_path).to eq root_path
    expect(page).to have_content 'メールを送信したのでご確認ください。'

    # 有効化されてない状態でログインしてみる
    visit login_path
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page).to have_selector('.alert-danger', text: 'ログインに失敗しました。')

    # 不正なトークン
    visit activate_user_url('invalid_token')
    expect(page).to have_selector('.alert-danger', text: 'URLが間違っています。')

    # 正しい有効化トークンでログイン
    visit activate_user_url(User.last.activation_token)
    expect(page).to have_selector('.alert-success', text: 'アクティベートされました')

    # 同時にログインされているか
    expect(current_path).to eq root_path
    subject { page }
    expect(page).to have_link 'Home'
    expect(page).to_not have_link '登録'
    expect(page).to_not have_link 'ログイン'
    expect(page).to have_selector("img[src*='default_user']")
    expect(page).to have_selector('.dropdown-toggle')
    expect(page).to have_link 'マイページ'
    expect(page).to have_link '設定'
    expect(page).to have_link 'ログアウト'
  end
end

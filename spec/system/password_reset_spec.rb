require 'rails_helper'

RSpec.describe 'Password reset', type: :system do
  let(:user) { FactoryBot.create(:user) }

  describe 'password reset' do
    before do
      login(user) # モジュールに切り分けた
      click_on 'ログアウト'
    end

    it 'reset password' do
      visit new_password_reset_path
      # 不正なメールアドレス
      fill_in 'メールアドレス', with: 'in@valid'
      click_button '送信'
      expect(page).to have_selector('.alert-danger', text: 'メールアドレスが正しくありません。')

      # 正しいメールアドレス
      fill_in 'メールアドレス', with: user.email
      click_button '送信'
      expect(current_path).to eq root_path
      expect(page).to have_selector('.alert-success', text: 'パスワードリセットメールを送信しました。')

      # 不正なトークン
      visit edit_password_reset_url('invalid_token')
      expect(current_path).to eq login_path
      expect(page).to have_selector('.alert-danger', text: 'URLが不正です。')

      # 正しい有効化トークン
      visit edit_password_reset_url(User.last.reset_password_token)
      expect(page).to have_selector('h1', text: 'パスワードリセット')
      expect(page).to have_content User.last.email
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード確認', with: 'password'
      click_button '決定'
      expect(current_path).to eq root_path
      expect(page).to have_selector('.alert-success', text: 'パスワードを更新しました。')

      # 同時にログインされているか
      expect(page).to have_link 'マイページ'
      expect(page).to have_link '設定'
      expect(page).to have_link 'ログアウト'
      expect(page).to_not have_content 'ログイン'
      expect(page).to_not have_content '登録'
    end
  end
end

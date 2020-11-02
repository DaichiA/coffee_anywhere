require 'rails_helper'

RSpec.describe "User edit", type: :system do
  let(:user) { FactoryBot.create(:user) }

  describe "as a authenticated user" do
    before do
      login(user) #モジュールに切り分けた
      click_link "設定"
    end

    subject { page }

    it "edit with email and password" do
      fill_in "メールアドレス", with: "editemail@example.com"
      fill_in "パスワード", with: "password"
      fill_in "パスワード確認", with: "password"
      click_button "決定"
      expect(current_path).to eq user_path(user)
      is_expected.to have_selector('.alert-success', text: 'プロフィールを更新しました。')
      is_expected.to have_content user.name
      is_expected.to have_content "editemail@example.com"
    end

    it "edit without email" do
      fill_in "メールアドレス", with: " "
      fill_in "パスワード", with: "password"
      fill_in "パスワード確認", with: "password"
      click_button "決定"
      is_expected.to have_selector('.alert-danger', text: 'エラーがあります。')
    end

     it "edit without password" do
      fill_in "メールアドレス", with: "editemail@example.com "
      fill_in "パスワード", with: " "
      fill_in "パスワード確認", with: " "
      click_button "決定"
      is_expected.to have_selector('.alert-danger', text: 'エラーがあります。')
    end

  end  

end

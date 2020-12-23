module LoginModule
  def login(user)
    # 登録からアクティベートまでの手順
    # 1.userをcreateする(テスト側でFactoryBotでやってる)
    # 2.update_attributes!でactiveにする(パスワードも求められるから一緒に)
    # →rails6.1からupdate_attributes!は使えなくなるからupdate!にしろとの警告
    # *ちなみにupdate_attributeではなくupdate_attributesにしろと公式に書いてる。
    #  詳しくはgithubのTesting Rails,「Feature Tests w/ Rack::Tests」へ

    # テスト側でuser = FactoryBot(:user)を記述してるからuserを使う
    user.update!(
      password: 'password',
      password_confirmation: 'password',
      activation_state: 'active'
    )
    visit login_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end
end

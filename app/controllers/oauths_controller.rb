class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path
      flash[:success] = "#{provider.titleize}でログインしました"
    else
      begin
        @user = create_from(provider)
        @user.activate!
        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path
        flash[:success] = "#{provider.titleize}でログインしました"
      rescue StandardError
        redirect_to root_path
        flash[:danger] = "#{provider.titleize}でのログインに失敗しました"
      end
    end
  end
end

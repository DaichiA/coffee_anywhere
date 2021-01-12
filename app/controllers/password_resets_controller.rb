class PasswordResetsController < ApplicationController
  # skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.deliver_reset_password_instructions!
      redirect_to root_path
      flash[:success] = 'パスワードリセットメールを送信しました。'
    else
      flash[:danger] = 'メールアドレスが正しくありません。'
      render new_password_reset_path
    end
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    return unless @user.blank?

    redirect_to login_path
    flash[:danger] = 'URLが不正です。'
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    if @user.blank?
      redirect_to login_path
      flash[:danger] = 'URLが不正です。'
    end
    # the next line makes the password confirmation validation work
    @user.password_confirmation = params[:user][:password_confirmation]
    # the next line clears the temporary token and updates the password
    if @user.change_password(params[:user][:password])
      redirect_to root_path
      auto_login(@user)
      flash[:success] = 'パスワードを更新しました。'
    else
      render action: 'edit'
    end
  end
end

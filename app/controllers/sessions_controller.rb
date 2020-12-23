class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]
  before_action :reject_logged_in, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path
      flash[:success] = 'ログインしました。'
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
    flash[:success] = 'ログアウトしました。'
  end
end

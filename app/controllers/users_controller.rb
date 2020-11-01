class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :reject_logged_in, only: [:new, :create]

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(params[:user][:email], params[:user][:password])
      flash[:success] = "登録が完了しました。"
      redirect_to root_path
    else
      render 'new'
      # redirect_to signup_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to @user
      #余裕があればアドレスやパスワード毎にフォームを分けて個別に編集できるようにする
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

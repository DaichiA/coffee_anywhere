class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :reject_logged_in, only: [:new, :create]
  before_action :correct_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # UserMailer.activation_needed_email(@user).deliver_now
      #↑sorceryによってactiveteアクションで自動でメール送られているみたいなので上記コードは不要
      flash[:success] = "メールを送信したのでご確認ください。"
      redirect_to root_path
    else
      render 'new'
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

  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      auto_login(@user)
      redirect_to root_path
      flash[:success] = 'アクティベートされました'
    else
      # not_authenticated
      redirect_to root_path
      flash[:danger] = "URLが間違っています。"
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    #beforeアクション
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

end
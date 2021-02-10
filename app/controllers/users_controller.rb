class UsersController < ApplicationController
  before_action :require_login, only: %i[show edit update index]
  before_action :reject_logged_in, only: %i[new create]
  before_action :correct_user, only: %i[show edit update]
  before_action :admin_user, only: [:index]

  def index
    @users = User.includes(:image_attachment).paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @favorites = @user.shops.includes(:reviews).with_attached_image.paginate(page: params[:page])

    gon.shops = @user.shops
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image.attach(params[:user][:image])
    if @user.save
      # UserMailer.activation_needed_email(@user).deliver_now
      # ↑sorceryによってactiveteアクションで自動でメール送られているみたいなので上記コードは不要
      flash[:success] = 'メールを送信したのでご確認ください。'
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
      flash[:success] = 'プロフィールを更新しました。'
      redirect_to @user
    else
      render 'edit'
    end
  end

  # adminか自分のみ
  def destroy
    User.find(params[:id]).destroy
    if !current_user.nil? && current_user.admin?
      redirect_back(fallback_location: root_path)
      flash[:success] = 'ユーザーを削除しました。'
    else
      redirect_to root_path
      flash[:success] = 'アカウントを削除しました。'
    end
  end

  # 自分のみ
  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      auto_login(@user)
      redirect_to root_path
      flash[:success] = 'アクティベートされました'
    else
      # not_authenticated
      redirect_to root_path
      flash[:danger] = 'URLが間違っています。'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :image, :email, :password, :password_confirmation)
    end

    # beforeアクション
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end

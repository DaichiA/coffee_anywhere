class ReviewsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]

  def index
      @user = User.find(current_user.id)
      @reviews = @user.reviews.paginate(page: params[:page], per_page: 10)
  end

  # def new
  #   @shop = Shop.find(params[:shop_id])
  #   shop_id = @shop.id
  #   @review = @shop.review.build(shop_id: shop_id)
  # end

  def create
    shop = Shop.find(params[:shop_id])
    @review = shop.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = "レビューを投稿しました"
      redirect_to shop_path(shop)
    else
      flash[:danger] = "レビューを投稿できませんでした"
      redirect_to shop_path(shop)
    end
  end

  def destroy
  end

  private

    def review_params
      params.require(:review).permit(:title, :content)
    end

end

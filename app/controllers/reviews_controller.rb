class ReviewsController < ApplicationController
  before_action :require_login

  # def new
  #   review = @review.new
  # end

  def create
    shop = Shop.find(params[:id])
    @review = shop.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = "レビューを投稿しました"
      reirect_to shop_path(shop)
    else
      flash[:danger] = "レビューを投稿できませんでした"
      reirect_to shop_path(shop)
  end

  def destroy
  end

  private

    def review_params
      params.require(:review).permit(:title, :content)
    end

end

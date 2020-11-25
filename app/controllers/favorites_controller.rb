class FavoritesController < ApplicationController
  before_action :require_login

  def create
    @shop = Shop.find(params[:shop_id])
    current_user.fav(@shop)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def destroy
    @shop = Favorite.find(params[:id]).shop
    current_user.unfav(@shop)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end


end

class Api::V1::ShopsController < ApiController
  def index
    shops = Shop.all
    render json: shops
  end
end

class ShopsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update]
  
  def index
    # @shops = Shop.paginate(page: params[:page])
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).paginate(page: params[:page])
    #static_pages_controllerのhomeでも同定義(検索窓を置いてるから)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
     @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.image.attach(params[:shop][:image])
    if @shop.save
      flash[:success] = "店情報を登録しました。"
      redirect_to shops_path
    else
      render 'new'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:success] = "店情報を更新しました。"
      redirect_to @shop
    else
      render 'edit'
    end
  end

  private
    
    def shop_params
      params.require(:shop).permit(:name, :image, :address, :phone_number, :business_hours, :description)
    end

    
end
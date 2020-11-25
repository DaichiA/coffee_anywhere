class ShopsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    # @shops = Shop.paginate(page: params[:page])
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).paginate(page: params[:page])
    #static_pages_controllerのhomeでも同定義(検索窓を置いてるから)
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_tags = @shop.tags #タグ一覧
    @review = @shop.reviews.build #フォーム 
    #reviewが降順になるのは保存されたタイミングなので、この時点では@review_firstには影響しない
  end

  def reviews
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews.paginate(page: params[:page], per_page: 10)
  end

  def new
     @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    tag_list = params[:shop][:tag_name].split #タグ実装 入力されたタグ
    @shop.image.attach(params[:shop][:image])
    if @shop.save
      @shop.save_tag(tag_list) #タグ実装
      flash[:success] = "店情報を登録しました。"
      redirect_to shops_path
    else
      render 'new'
    end
  end

  def edit
    @shop = Shop.find(params[:id])
    @tag_list = @shop.tags.pluck(:tag_name).join(" ") #タグ実装
    @every_tags = @shop.tags
  end

  def update
    @shop = Shop.find(params[:id])
    tag_list = params[:shop][:tag_name].split(" ") #タグ実装
    if @shop.update(shop_params)
      @shop.save_tag(tag_list) #タグ実装
      flash[:success] = "店情報を更新しました。"
      redirect_to @shop
    else
      render 'edit'
    end
  end

  def destroy
    Shop.find(params[:id]).destroy
    flash[:success] = "店舗情報を削除しました。"
    redirect_to shops_path
  end

  private
    
    def shop_params
      params.require(:shop).permit(:name, :image, :address, :phone_number, :business_hours, :dayoff, :description, { :tag_name => [], :tag_ids => [] })
    end

end

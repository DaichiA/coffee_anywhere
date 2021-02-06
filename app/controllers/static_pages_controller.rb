class StaticPagesController < ApplicationController
  def home
    @q = Shop.ransack(params[:q])
    @tags = Tag.all
    tag_names = @tags.pluck(:tag_name)
    brew_methods = %w[ドリップ エスプレッソ フレンチプレス エアロプレス 水出し サイフォン]
    @tags_for_search = tag_names - brew_methods

    rand = Shop.pluck(:id).sample(3)
    @shops = Shop.includes(:image_attachment, :reviews).find(rand)
    # @shops.each do |@shop| end
  end

  def terms; end

  def privacy; end
end

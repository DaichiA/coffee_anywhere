class StaticPagesController < ApplicationController
  def home
    @q = Shop.ransack(params[:q])
    @tags = Tag.all
    tag_names = @tags.pluck(:tag_name)
    brew_methods = ['ドリップ', 'エスプレッソ', 'フレンチプレス', 'エアロプレス', '水出し', 'サイフォン']
    @tags_for_search = tag_names - brew_methods
  end

  def terms; end

  def privacy; end
end

class StaticPagesController < ApplicationController
  def home
    # @q = Shop.ransack(params[:q])
    # @shops = @q.result(distinct: true).paginate(page: params[:page])
    @tags = Tag.all
    tag_names = @tags.pluck(:tag_name)
    brew_methods = ['ドリップ', 'エスプレッソ', 'フレンチプレス', 'エアロプレス', '水出し', 'サイフォン']
    @tags_for_search = tag_names - brew_methods

    if params[:q] != nil
      @q = params[:q].split(/[\p{blank}\s]+/)
      grouping_hash = @q.reduce({}) { |hash, word| hash.merge(word => { title_cont: word }) }
      @shops = Shop.ransack(
        { combinator: 'and', groupings: grouping_hash, s: 'title desc' }
      ).result(distinct: true).paginate(page: params[:page])
    else
      @q = Shop.ransack(params[:q])
      @shops = @q.result(distinct: true).paginate(page: params[:page])
    end
  end

  def terms; end

  def privacy; end
end

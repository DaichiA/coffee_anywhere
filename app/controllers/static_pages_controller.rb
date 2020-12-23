class StaticPagesController < ApplicationController
  def home
    # @q = Shop.ransack(params[:q])
    # @shops = @q.result(distinct: true).paginate(page: params[:page])
    @tags = Tag.all
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

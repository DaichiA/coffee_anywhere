class CommentsController < ApplicationController
  def create
    review = Review.find(params[:review_id]) # hidden_tag でreview_id仕込む
    @comment = review.comments.build(comment_params)
    @comment.user_id = current_user.id  
    if @comment.save
      redirect_back(fallback_location: root_path)
      flash[:success] = 'コメントを投稿しました'
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'コメントを投稿できませんでした'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :username)
  end
end

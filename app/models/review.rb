class Review < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :shop
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :shop_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :rate, presence: true
  validates :content, presence: true, length: { maximum: 300 }

  def create_notification_comment!(current_user, comment_id, reviewer_id)
    # レビュー投稿者を除きコメントした人全員を取得
    commenters = Comment.select(:user_id).where(review_id: id).where.not(user_id: current_user.id)
    # 通知を送る人たち = 上記の人+レビュー投稿者のID（重複なし）
    ids = commenters.pluck(:user_id).push(reviewer_id).uniq
    ids.each do |id|
      save_notification_comment!(current_user, comment_id, id)
    end
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # 1コメントごとに１回通知
    notification = current_user.active_notifications.new(
      review_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )

    # 自分の投稿に対する自分のコメントの場合は通知しない
    notification.save if notification.valid? && notification.visitor_id != notification.visited_id
  end
end

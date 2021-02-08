class AddReviewIdToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :review_id, :integer

    add_index :notifications, :review_id
  end
end

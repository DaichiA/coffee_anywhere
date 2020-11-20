class AddIndexToReviews < ActiveRecord::Migration[6.0]
  def change
    add_index :reviews, [:user_id, :created_at]
    add_index :reviews, [:shop_id, :created_at]
  end
end

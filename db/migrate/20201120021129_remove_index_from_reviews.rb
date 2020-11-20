class RemoveIndexFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_index :reviews, [:user_id, :shop_id, :created_at]
  end
end

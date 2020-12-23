class AddIndexToReviews < ActiveRecord::Migration[6.0]
  def change
    add_index :reviews, %i[user_id created_at]
    add_index :reviews, %i[shop_id created_at]
  end
end

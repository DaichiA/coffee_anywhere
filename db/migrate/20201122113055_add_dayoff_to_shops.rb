class AddDayoffToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :dayoff, :string
  end
end

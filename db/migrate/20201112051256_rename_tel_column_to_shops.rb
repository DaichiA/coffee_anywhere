class RenameTelColumnToShops < ActiveRecord::Migration[6.0]
  def change
    rename_column :shops, :tel, :phone_number
  end
end

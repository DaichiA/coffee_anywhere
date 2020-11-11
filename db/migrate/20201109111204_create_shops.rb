class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :business_hours

      t.timestamps
    end
  end
end

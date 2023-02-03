class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,         null: false
      t.string :price,             null: false
      t.string :detail,            null: false
      t.string :postage_id,        null: false
      t.string :category_id,       null: false
      t.string :state_id,          null: false
      t.string :area_id,           null: false
      t.string :sipping_day_id,    null: false

      t.timestamps
    end
  end
end

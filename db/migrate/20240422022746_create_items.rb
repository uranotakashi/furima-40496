class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name         ,null: false
      t.text   :description       ,null: false
      t.integer :category_id      ,null: false
      t.integer :situation_id     ,null: false
      t.integer :shipping_fee_id  ,null: false
      t.integer :delivery_area_id ,null: false
      t.integer :delivery_date_id ,null: false
      t.integer :price            ,null: false
      t.references :user          ,null: false, foreign_key: true
      t.timestamps
    end
  end
end

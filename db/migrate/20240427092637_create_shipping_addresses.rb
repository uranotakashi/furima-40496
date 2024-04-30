class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|

      t.references :purchase,null: false, foreign_key: true
      t.integer    :delivery_area_id    ,null: false
      t.string     :zip_code            ,null: false
      t.string     :city                ,null: false
      t.string     :house_number        ,null: false
      t.string     :building_name       
      t.string     :telephone_number    ,null: false
      
      t.timestamps
    end
  end
end




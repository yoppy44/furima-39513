class CreateRecipients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipients do |t|
      t.string     :post_cord,        null: false
      t.integer    :shipping_origin_area_id,    null: false, foreign_key: true
      t.string     :municipalities,   null: false
      t.string     :address,          null: false
      t.string     :building_name
      t.string     :telephone_number, null: false
      t.references :purchase,         null: false, foreign_key: true
      t.timestamps
    end
  end
end

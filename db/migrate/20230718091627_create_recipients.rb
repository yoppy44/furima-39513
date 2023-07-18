class CreateRecipients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipients do |t|
      t.string     :post_cord,        null: false
      t.integer    :prefecture_id,    null: false
      t.string     :municipalities,   null: false
      t.string     :address,          null: false
      t.string     :building_name,    null: false
      t.string     :telephone_number, null: false
      t.references :purchase,         null: false, foreign_key: true
      t.timestamps
    end
  end
end

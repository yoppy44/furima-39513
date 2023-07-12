class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :price, presence: true
  validates :delivery_charge_id, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :quality_id, presence: true
  validates :shipping_origin_area_id, presence: true
  validates :delivery_date_id, presence: true

  belongs_to :user
end

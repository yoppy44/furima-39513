class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_charge
  belongs_to :category
  belongs_to :quality
  belongs_to :shipping_origin_area
  belongs_to :delivery_date
end

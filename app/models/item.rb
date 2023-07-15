class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_charge
  belongs_to :category
  belongs_to :quality
  belongs_to :shipping_origin_area
  belongs_to :delivery_date

   validates :item_name, presence: true
   validates :price, presence: true
   validates :price, numericality: { only_integer: true ,message: "is invalid. Input half-width characters"}
   validates :price, numericality: { greater_than_or_equal_to: 300 ,  less_than_or_equal_to: 9999999 , message: "is out of setting range"}
   validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :explanation, presence: true
   validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :quality_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :shipping_origin_area_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :image, presence: true
end

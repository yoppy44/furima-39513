class PurchaseRecipient
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_cord, :shipping_origin_area_id, :municipalities, :address, :building_name, :telephone_number, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_cord
    validates :municipalities
    validates :address
    validates :telephone_number
  end  
  validates :post_cord, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  validates :shipping_origin_area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is too short"}
  validates :telephone_number, format: {with: /\A[0-9]+\z/, message: "is invalid. Input only number"}


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Recipient.create(post_cord: post_cord, shipping_origin_area_id: shipping_origin_area_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end  
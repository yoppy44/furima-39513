class PurchaseRecipient
  include ActiveModel::Model
  attr_accessor :user, :item, :post_cord, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :perfecture

  with_options presence: true do
    validates :user
    validates :item
    validates :post_cord
    validates :post_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :telephone_number
    validates :telephone_number, numericality: { is: 11 , message: "is too short"}
    validates :telephone_number, numericality: { only_integer: true , message: "is invalid. Input only number"}
  end 

  def save
    purchase = Purchase.create(user: user, item: item)
    Recipient.create(post_cord: post_cord, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchase: purchase)
  end
end  
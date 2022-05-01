class BuyersOrder
  include ActiveModel::Model
  attr_accessor :post_number, :region_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id, :token
  JAPANESE_CHARACTER = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_number,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality, format: {with: JAPANESE_CHARACTER}
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]+\z/}, length: {minimum: 10, maximum: 11}
  end
  validates :region_id,      numericality: {other_than: 1}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Buyer.create(post_number: post_number, region_id: region_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
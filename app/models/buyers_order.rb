class BuyersOrder
  include ActiveModel::Model
  attr_accessor :post_number, :region_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id
  JAPANESE_CHARACTER = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality, format: {with: JAPANESE_CHARACTER}
    validates :house_number, format: {with: JAPANESE_CHARACTER}
    validates :phone_number, format: {with: /\A[0-9]+\z/}
  end
  validates :region_id,      numericality: {other_than: 1}
  validates :building_name,  format: {with: JAPANESE_CHARACTER}

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Buyer.create(post_number: post_number, region_id: region.id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to             :user
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_date
  has_one_attached       :image
  validates              :image,            presence: true
  validates              :name,             presence: true
  validates              :explanation,      presence: true
  validates              :category_id,      numericality: { other_than: 1 }
  validates              :state_id,         numericality: { other_than: 1 }
  validates              :postage_id,       numericality: { other_than: 1 }
  validates              :region_id,        numericality: { other_than: 1 }
  validates              :shipping_date_id, numericality: { other_than: 1 }
  validates              :price,            presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/ }
  #has_many              :comments,         dependent: :destroy
  has_one                :order,            dependent: :destroy
end

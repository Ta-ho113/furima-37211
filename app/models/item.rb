class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :user
  belongs_to       :category_genre
  belongs_to       :state_genre
  belongs_to       :postage_genre
  belongs_to       :region_genre
  belongs_to       :shipping_date_genre
  has_one_attached :image
  validates        :name,             presence: true
  validates        :explanation,      presence: true
  validates        :category_id,      numericality: { other_than: 1 }
  validates        :state_id,         numericality: { other_than: 1 }
  validates        :postage_id,       numericality: { other_than: 1 }
  validates        :region_id,        numericality: { other_than: 1 }
  validates        :shipping_date_id, numericality: { other_than: 1 }
  validates        :price,            presence: true
  #has_many         :comments,         dependent: :destroy
  #has_one          :purchased_item,   dependent: :destroy
end

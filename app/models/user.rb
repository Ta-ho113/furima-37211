class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  JAPANESE_CHARACTER = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  JAPANESE_KATAKANA = /\A[ァ-ヶー－]+\z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,              presence: true
  validates :password,              format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, presence: true
  validates :last_name,             presence: true, format: { with: JAPANESE_CHARACTER }
  validates :first_name,            presence: true, format: { with: JAPANESE_CHARACTER }
  validates :last_katakana,         presence: true, format: { with: JAPANESE_KATAKANA }
  validates :first_katakana,        presence: true, format: { with: JAPANESE_KATAKANA }
  validates :birth_day_id,          presence: true
  #has_many :purchased_items,       dependent: :destroy
  #has_many :comments,              dependent: :destroy
  has_many  :items,                 dependent: :destroy
end

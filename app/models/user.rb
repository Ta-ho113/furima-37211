class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,              presence: true
  validates :email,                 presence: true
  validates :encrypted_password,    presence: true
  validates :password_confirmation, presence: true
  validates :last_name,             presence: true
  validates :first_name,            presence: true
  validates :last_katakana,         presence: true
  validates :first_katakana,        presence: true
  validates :birth_day_id,          presence: true
  has_many :purchased_items,        dependent: :destroy
  has_many :comments,               dependent: :destroy
  has_many :items,                  dependent: :destroy
end

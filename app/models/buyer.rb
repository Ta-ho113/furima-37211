class Buyer < ApplicationRecord
  belongs_to :item
  belongs_to :region
end

class Cart < ApplicationRecord
  has_many :items, through: :cart_items
  belongs_to :user
end

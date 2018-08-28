class Item < ApplicationRecord
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0 }
  validates :title, :description, :image_url, presence: true
  has_many :cart_items
  has_many :carts, through: :cart_items
end

class Order < ApplicationRecord
  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders

  after_create :email_user

  def email_user
    CustomerMailer.order_email(self).deliver
  end
end

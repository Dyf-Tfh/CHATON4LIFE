class AdminMailer < ApplicationMailer

  def new_order_email(order)
    @order = order
    mail(to: 'chaton4life.eshop@gmail.com', subject: 'New Order')
  end

end

class CustomerMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'New User Registration - Chaton4life')
  end


  def order_email(order)
    @order = order
    mail(to: @user.email, subject: 'Order Confirmation - Chaton4life')
  end
end

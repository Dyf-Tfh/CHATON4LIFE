class CustomerMailer < ApplicationMailer

  def welcome_email(user)
    @user = current_user
    mail(to: @user.email, subject: 'New User Registration - Chaton4life')
  end

  def order_email(user)
    mail(to: user, subject: 'Your order - Chaton4life')
  end
end

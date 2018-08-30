class CustomerMailer < ApplicationMailer

  def customer_email(user)
    mail(to: user, subject: 'Your Order')
  end

end

class CustomerMailer < ApplicationMailer

  def contact
    mail(to: @user.email, subject: 'Your Order')
  end

end

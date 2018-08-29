class AdminMailer < ApplicationMailer

  def contact
    mail(to: 'chaton4life.eshop@gmail.com', subject: 'New Order')
  end

end

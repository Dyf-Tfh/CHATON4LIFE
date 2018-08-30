class AdminMailer < ApplicationMailer

  def admin_email 
    mail(to: 'chaton4life.eshop@gmail.com', subject: 'New Order')
  end

end

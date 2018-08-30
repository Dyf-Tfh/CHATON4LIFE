class UserController < ApplicationController

  def welcome_email
    @user = user
    if user.save
      CustomerMailer.welcome_email.deliver_now!
    end
  end
end

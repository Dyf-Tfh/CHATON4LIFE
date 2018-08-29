class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = @order.total_price * 100

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    AdminMailer.admin_email(stripe_params["stripeEmail"]).deliver_now!
    CustomerMailer.customer_email(stripe_params["stripeEmail"]).deliver_now!

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end

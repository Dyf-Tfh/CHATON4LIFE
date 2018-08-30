class CartsController < ApplicationController
  def show
    if current_user.cart.nil?
      Cart.create!(id: current_user.id, user_id: current_user.id)
    end
    @cart = Cart.find(current_user.id)
  end

  def delete
    Cart.find(params[:id]).cart_items.find_by(item_id: params[:item]).delete
    redirect_to mon_panier_path
  end

  def quantity
    @b = params[:quantity].to_d
  end

  def create
      @user = current_user
      set_cart
      new_charge
    if @charge.save
      @order = Order.new(
      user_id: current_user.id,
    )

      if @order.save
        CustomerMailer.order_email(@user.email).deliver_now
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
      else
        render new
      end
      redirect_to root_path
    else
      flash[:error] = "Problème de paiement"
      redirect_to mon_panier_path
    end
  end

  def new_charge
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    token = params.require(:stripeToken)

    @charge = Stripe::Charge.create({
        amount: (current_user.cart.items.to_a.sum { |item| item.price }.to_i) *100,
        currency: 'eur',
        description: "Total",
        source: token,
    })
  end

    private

    def set_cart
      if user_signed_in? && !current_user.cart.nil?
        @cart = current_user.cart
        session[:cart_id] = current_user.cart.id
      else
        @cart = current_cart
      end
    end
end

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
      set_cart
      new_charge
    if @charge.save
      redirect_to new_order_path
    else
      flash[:error] = "Problème de paiement"
      redirect_to mon_panier_path
    end
  end

  def new_charge
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    token = params.require(:stripeToken)

    @charge = Stripe::Charge.create({
        amount: @total,
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

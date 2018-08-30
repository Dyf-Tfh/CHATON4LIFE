class CartController < ApplicationController
  def show
    if current_user.cart.nil?
      Cart.create!(id: current_user.id, user_id: current_user.id)
    end
    @cart = Cart.find(current_user.id)
  end

  def delete
    Cart.find(params[:id]).cart_items.find(item_id: params[:item]).delete
    redirect_to mon_panier_path
  end

  def quantity
    @b = params[:quantity].to_d
  end

end

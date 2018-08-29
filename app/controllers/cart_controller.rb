class CartController < ApplicationController
  def show
    @cart = Cart.find(current_user.id)
  end

  def delete
    CartItem.find(params[:id]).items.find(params[:item]).delete
    redirect_to mon_panier_path
  end

  def quantity
    @b = params[:quantity].to_d
  end


end

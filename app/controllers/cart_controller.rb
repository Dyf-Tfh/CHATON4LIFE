class CartController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def delete
    Cart.find(params[:id]).items.find(params[:item]).delete
    redirect_to mon_panier_path
  end
end

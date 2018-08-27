class CartController < ApplicationController
  def show
    @cart = Cart.all
  end
end

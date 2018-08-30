class OrderController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
    else
      render new
    end
  end

  private

  def order_params
    params.require(:order).permit(:total_price)
  end
end

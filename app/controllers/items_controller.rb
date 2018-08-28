class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :image_url)
  end

end

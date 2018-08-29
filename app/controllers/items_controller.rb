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

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url)
  end

  def add
  	@item = Item.find(params[:id])
    CartItem.create!(cart_id: current_user.id, item_id: @item.id)
  	redirect_to mon_panier_path
  end
end

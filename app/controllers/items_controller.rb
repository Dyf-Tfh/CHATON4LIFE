class ItemsController < ApplicationController
  def index
    @items = Item.all
    Item.all.each_with index do |item,i| 
      item.small_image.attach(io: File.open('storage/small/cat_') + format("%04d", i) + '.jpg', filename: 'cat_' + format("%04d", i) + '.jpg')
      item.small_image.attach(io: File.open('storage/large/cat_') + format("%04d", i) + '.png', filename: 'cat_' + format("%04d", i) + '.png')
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

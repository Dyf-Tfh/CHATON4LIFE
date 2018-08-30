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

  def config
    # pour lier activestorage en local ne sert que durant la config
    Item.all.each_with_index do |item,i|
      item.small_image.attach(io: File.open('small/cat_') + format("%04d", i) + '.jpg', filename: 'cat_' + format("%04d", i) + '.jpg')
      item.small_image.attach(io: File.open('large/cat_') + format("%04d", i) + '.png', filename: 'cat_' + format("%04d", i) + '.png')
     end
  end
end

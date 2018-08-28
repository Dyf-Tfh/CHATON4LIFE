class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item.new(params[:item])
  end

  # def new
  #   @item = Item.new
  #   @item.proposition_id = params[:proposition_id]
  # end


end

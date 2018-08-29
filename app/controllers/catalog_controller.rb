class CatalogController < ApplicationController
  def index
    @items = item.order(:title)
  end
end

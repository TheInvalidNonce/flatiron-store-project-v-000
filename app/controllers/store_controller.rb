class StoreController < ApplicationController
  
  def index
    @categories = Category.all
    @items = Item.available_items # only show available items
  end
end

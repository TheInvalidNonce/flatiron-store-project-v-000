class CategoriesController < ApplicationController
  
  def show
    set_category
  end
  
  def index
  end
  
  private
  
  def set_category
    @category = Category.find_by(id: params[:id])
  end
end

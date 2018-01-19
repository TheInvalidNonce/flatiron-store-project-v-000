class CartsController < ApplicationController
  
  def show
    set_cart
  end
  
  def checkout
    # This method needed to check if @current_cart == true for the 1st block in carts/show.erb
    # and @current_cart == true && @current_cart.status == "Not submitted" to allow the Checkout button to work/be found in the tests
    @user = current_user
    
    @current_cart = Cart.find_by(id: params[:id])
    
    @current_cart.line_items.each do |line_item|
      line_item.item.update(inventory: line_item.item.inventory -= line_item.quantity)  
    end
    
    @user.update(current_cart: nil)
    
    redirect_to @current_cart
  end
  
  private
  
  def set_cart
    @current_cart = current_user.current_cart
  end
end

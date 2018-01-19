class LineItemsController < ApplicationController
  
  # This logic passed the tests but did not add a new unique item to the cart list
  # def create
  #   # @item broke this
  #   item = params[:item_id]
    
  #   # If the current_cart and the current_user already exist
  #   if current_user && current_user.current_cart
  #     # Add the item
  #     current_user.current_cart.add_item(item)
  #   # ELSIF current_user exists, but no current_cart, create the current_cart
  #   elsif current_user
  #     current_user.current_cart = current_user.carts.create
  #     # Then add the item to the new (current_cart)
  #     current_user.current_cart.add_item(item).save
  #   end
  #   current_user.save
  #   redirect_to cart_path(current_user.current_cart)
  # end
  
  def create
    if !current_user.current_cart
      current_user.current_cart = Cart.new
      current_user.save
    end
      
    line_item = current_user.current_cart.add_item(params[:item_id])
      
    if line_item.save
      redirect_to cart_path(current_user.current_cart)
    else
      redirect_to store_path
    end
  end
  
end

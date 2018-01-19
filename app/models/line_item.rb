class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item
  
  # Create or update a new line_item object by passing in an the 
  # item_id and cart_id to associate it to
  # def self.create_or_update(item_id, cart_id)
  #   # Initialize the object
  #   line_item = LineItem.find_by(item_id: item_id, cart_id: cart_id)
    
  #   # IF an existing line_item is found...
  #   if line_item
  #     # Add one item to the line_item...and return it
  #     line_item.quantity += 1
  #     line_item
  #   # ELSE create the new line_item
  #   else
  #     line_item = LineItem.new(item_id: item_id, cart_id: cart_id, quantity: 1)
  #   end
  # end
  
  
end

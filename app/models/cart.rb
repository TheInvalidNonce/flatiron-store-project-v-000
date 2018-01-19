class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  
  # Add an item by adding its item_id
  def add_item(item_id)
    # Calling the old method LineItem.create_or_update didn't update the line_items in current_cart
    # LineItem.create_or_update(item_id, self.id) 
    
    line_item = self.line_items.find_by(item_id: item_id, cart_id: self.id)
    
    if line_item
      line_item.quantity += 1
      line_item.save
    else
      line_item = self.line_items.build(item_id: item_id, cart_id: self.id)
    end
    line_item
  end
  
  def total
    total = 0
    # @cart.line_items on each line_item
    self.line_items.each do |line_item|
      # Sum the line_item.item.price * line_item.quantity and return it outside
      total += line_item.item.price * line_item.quantity
    end
    total
  end
end

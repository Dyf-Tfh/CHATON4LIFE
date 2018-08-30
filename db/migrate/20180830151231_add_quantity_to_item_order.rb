class AddQuantityToItemOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :item_orders, :quantity, :integer
  end
end

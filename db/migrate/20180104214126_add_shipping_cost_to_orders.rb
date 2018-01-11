class AddShippingCostToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :shipping_cost, :integer
  end
end

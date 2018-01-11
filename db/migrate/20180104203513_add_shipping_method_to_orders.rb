class AddShippingMethodToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :shipping_method, :string
  end
end

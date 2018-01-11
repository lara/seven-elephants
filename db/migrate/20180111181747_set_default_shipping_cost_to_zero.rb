class SetDefaultShippingCostToZero < ActiveRecord::Migration[5.1]
  def change
    change_column_default :orders, :shipping_cost, 0
  end
end

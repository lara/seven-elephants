class AddPlaceIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :place_id, :string
  end
end

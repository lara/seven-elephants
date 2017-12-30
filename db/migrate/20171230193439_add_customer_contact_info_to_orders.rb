class AddCustomerContactInfoToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :customer_name, :string
    add_column :orders, :customer_phone_number, :string
  end
end

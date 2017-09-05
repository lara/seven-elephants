class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    enable_extension :citext
    create_table :orders do |t|
      t.citext :email
      t.text :address
      t.datetime :placed_at
      t.datetime :shipped_at
      t.datetime :cancelled_at

      t.timestamps
    end
  end
end

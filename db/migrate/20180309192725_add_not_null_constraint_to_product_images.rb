class AddNotNullConstraintToProductImages < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :images, :json, null: false
  end
end

class AddDimensionsAndWeightToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :length, :float, null: false
    add_column :products, :width, :float, null: false
    add_column :products, :height, :float, null: false
    add_column :products, :weight, :float, null: false
  end
end

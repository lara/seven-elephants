class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader

  searchable do
    text :name, boost: 4.0
    text :description
  end
end

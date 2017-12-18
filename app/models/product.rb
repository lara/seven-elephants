class Product < ApplicationRecord
  mount_uploaders :images, ProductImagesUploader

  searchable do
    text :name, boost: 4.0
    text :description
  end
end

class Product < ApplicationRecord
  validates :length, :width, :height, :weight, numericality: true
  mount_uploaders :images, ProductImagesUploader

  searchable do
    text :name, boost: 4.0
    text :description
  end
end

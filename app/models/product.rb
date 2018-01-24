class Product < ApplicationRecord
  validates :length, :width, :height, :weight, numericality: true
  mount_uploaders :images, ProductImagesUploader
end

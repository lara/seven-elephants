class Product < ApplicationRecord
  validates :length, :width, :height, :weight, numericality: true
  validates :image, presence: true
  mount_uploaders :images, ProductImagesUploader
end

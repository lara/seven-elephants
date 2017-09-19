class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader
end

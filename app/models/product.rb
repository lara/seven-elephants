class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  scope :search, ->(search_term) do
    where("name||description||name ilike :term", term: "%#{search_term.gsub(" ", "%")}%")
  end
end

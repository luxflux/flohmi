class Article < ApplicationRecord
  has_many_attached :images

  validates :title, presence: true
  validates :description, presence: true
  validates :price_range, numericality: true
end

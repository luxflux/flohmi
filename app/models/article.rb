class Article < ApplicationRecord
  has_many_attached :images

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
end

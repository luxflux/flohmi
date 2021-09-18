class Article < ApplicationRecord
  has_many_attached :images
  has_many :contact_requests

  validates :title, presence: true
  validates :description, presence: true
  validates :price_range, numericality: true, allow_blank: true
end

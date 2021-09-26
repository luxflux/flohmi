class Article < ApplicationRecord
  has_many_attached :images
  has_many :contact_requests, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :price_range, numericality: true, allow_blank: true

  def main_image
    @main_image ||= images.order(id: :asc).first
  end

  def sold?
    sold_at.present?
  end
end

class ContactRequest < ApplicationRecord
  belongs_to :article

  validates :name, presence: true
  validates :email, presence: true, format: /.+@.+\..+/
  validates :phone, presence: true, phone: true
end

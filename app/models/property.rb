class Property < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :price, numericality: { greater_than: 0 }
  validates :photos, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validates :comuna, :address, :latitude, :longitude, presence: true
  validates :description, format: { without: /\b(\w+@\w+\.\w+|http\S+|[0-9]{8,})\b/, message: "no debe contener datos de contacto" }
end

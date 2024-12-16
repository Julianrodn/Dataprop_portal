class Property < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :comuna
  belongs_to :user
  has_many_attached :photos

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :photos, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], on: :create

  validates :comuna, :address, :latitude, :longitude, presence: true
  validates :description, format: { without: /\b(\w+@\w+\.\w+|http\S+|[0-9]{8,})\b/, message: "no debe contener datos de contacto" }

  validates :property_type, inclusion: { in: ['Arriendo', 'Venta'] }
end

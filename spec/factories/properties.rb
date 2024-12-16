FactoryBot.define do
  factory :property do
    address { Faker::Address.full_address }
    price { Faker::Number.decimal(l_digits: 6, r_digits: 2) }
    currency { 'CLP' }
    area { Faker::Number.decimal(l_digits: 3) }
    bedrooms { Faker::Number.between(from: 1, to: 5) }
    bathrooms { Faker::Number.between(from: 1, to: 3) }
    property_type { ['Arriendo', 'Venta'].sample }
    description { Faker::Lorem.sentence }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }

    association :user
    association :comuna

    after(:build) do |property|
      property.photos.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'sample.jpg')), filename: 'sample.jpg', content_type: 'image/jpeg')
    end
  end
end

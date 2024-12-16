user1 = User.create!(email: 'usuario1@dataprop.com', password: 'password', password_confirmation: 'password')
user2 = User.create!(email: 'usuario2@dataprop.com', password: 'password', password_confirmation: 'password')
user3 = User.create!(email: 'usuario3@dataprop.com', password: 'password', password_confirmation: 'password')

10.times do |i|
  user1.properties.create!(
    address: "Propiedad #{i + 1} de usuario 1",
    comuna: Comuna.first,  # Asume que tienes alguna comuna creada
    price: rand(100_000..500_000),
    currency: 'CLP',
    area: rand(50..150),
    bedrooms: rand(1..5),
    bathrooms: rand(1..3),
    property_type: ['Casa', 'Departamento', 'Terreno'].sample,
    description: "Descripción de la propiedad #{i + 1} de usuario 1."
  )
end

3.times do |i|
  user2.properties.create!(
    address: "Propiedad #{i + 1} de usuario 2",
    comuna: Comuna.first,  # Asume que tienes alguna comuna creada
    price: rand(100_000..500_000),
    currency: 'CLP',
    area: rand(50..150),
    bedrooms: rand(1..5),
    bathrooms: rand(1..3),
    property_type: ['Casa', 'Departamento', 'Terreno'].sample,
    description: "Descripción de la propiedad #{i + 1} de usuario 2."
  )
end

7.times do |i|
  user3.properties.create!(
    address: "Propiedad #{i + 1} de usuario 3",
    comuna: Comuna.first,  # Asume que tienes alguna comuna creada
    price: rand(100_000..500_000),
    currency: 'CLP',
    area: rand(50..150),
    bedrooms: rand(1..5),
    bathrooms: rand(1..3),
    property_type: ['Casa', 'Departamento', 'Terreno'].sample,
    description: "Descripción de la propiedad #{i + 1} de usuario 3."
  )
end

puts "Usuarios y propiedades creadas exitosamente!"

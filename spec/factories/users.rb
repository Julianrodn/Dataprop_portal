FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }

    trait :with_properties do
      after(:create) do |user|
        create_list(:property, 10, user: user) # 10 propiedades para este usuario
      end
    end
  end
end

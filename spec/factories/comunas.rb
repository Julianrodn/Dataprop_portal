FactoryBot.define do
  factory :comuna do
    name { Faker::Address.city }
  end
end

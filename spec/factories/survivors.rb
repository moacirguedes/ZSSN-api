FactoryBot.define do
  factory :survivor do
    name { Faker::Name.name }
    age { Faker::Number.between(from: 0, to: 100) }
    gender { %w[male female other].sample }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end

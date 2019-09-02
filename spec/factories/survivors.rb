FactoryBot.define do
  factory :survivor do
    name { Faker::Name.name }
    age { Faker::Number.between(from: 0, to: 100) }
    gender { %w[male female other].sample }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end

  factory :invalid_survivor, parent: :survivor do
    name { nil }
    age { nil }
    gender { nil }
    latitude { nil }
    longitude { nil }
  end
end

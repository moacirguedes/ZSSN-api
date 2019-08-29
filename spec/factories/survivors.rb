FactoryBot.define do
  factory :survivor do
    name { "MyString" }
    age { 1 }
    gender { 1 }
    latitude { 1.5 }
    longitude { 1.5 }
    infected { false }
  end
end

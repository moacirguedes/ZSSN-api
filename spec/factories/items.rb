FactoryBot.define do
  factory :item do
    name { Item.items.keys.sample }
    survivor { create(:survivor) }

    trait :water do
      before(:create) do |item|
        item.name = 'water'
        item.value = 4
      end
    end

    trait :food do
      before(:create) do |item|
        item.name = 'food'
        item.value = 3
      end
    end

    trait :infected do
      after(:create) do |item|
        item.survivor.infected = true
        item.survivor.save
      end
    end
  end
end

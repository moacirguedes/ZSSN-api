FactoryBot.define do
  factory :item do
    name { Item.items.keys.sample }
    survivor { create(:survivor) }
  end
end

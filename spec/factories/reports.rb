FactoryBot.define do
  factory :report do
    reporter_survivor_id { create(:survivor).id }
    survivor_id { create(:survivor).id }
  end
end

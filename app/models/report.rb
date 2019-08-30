class Report < ApplicationRecord
  belongs_to :survivor

  validates :reporter_survivor_id, uniqueness: { scope: [:survivor_id] }
  validates :reporter_survivor_id, presence: true
end

class Report < ApplicationRecord
  belongs_to :survivor

  validates :reporter_survivor_id, presence: true
end

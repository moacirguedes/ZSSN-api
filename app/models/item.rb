class Item < ApplicationRecord
  enum items: { water: 4, food: 3, medication: 2, ammunition: 1 }

  validates :name, presence: true
  validates :name, inclusion: { in: items }

  belongs_to :survivor
end

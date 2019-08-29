class Item < ApplicationRecord
  @items = { 'water' => 4, 'food' => 3, 'medication' => 2, 'ammunition' => 1 }

  validates :name, presence: true
  validates :name, inclusion: { in: @items.keys }

  belongs_to :survivor

  class << self
    attr_reader :items
  end
end

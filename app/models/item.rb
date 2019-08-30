class Item < ApplicationRecord
  @items = { 'water' => 4, 'food' => 3, 'medication' => 2, 'ammunition' => 1 }

  validates :name, presence: true
  validates :name, inclusion: { in: @items.keys }

  belongs_to :survivor

  class << self
    attr_reader :items
  end

  def self.total_water
    Item.where(name: 'water', survivor_id: Survivor.non_infected_ids).count
  end

  def self.total_food
    Item.where(name: 'food', survivor_id: Survivor.non_infected_ids).count
  end

  def self.total_medication
    Item.where(name: 'medication', survivor_id: Survivor.non_infected_ids).count
  end

  def self.total_ammunition
    Item.where(name: 'ammunition', survivor_id: Survivor.non_infected_ids).count
  end

  def self.points_lost
    Item.where(survivor_id: Survivor.infected_ids).sum(:value)
  end
end

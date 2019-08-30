class Survivor < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true

  has_many :item
  has_many :report

  accepts_nested_attributes_for :item

  enum gender: %i[male female other]

  def self.total_survivors
    Survivor.count.to_f
  end

  def self.total_infected
    Survivor.where(infected: true).count.to_f
  end

  def self.total_non_infected
    Survivor.where(infected: false).count.to_f
  end

  def self.non_infected_ids
    Survivor.where(infected: false).pluck(:id)
  end

  def self.infected_ids
    Survivor.where(infected: true).pluck(:id)
  end
end

class Survivor < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true

  has_many :item
  has_many :report

  accepts_nested_attributes_for :item

  enum gender: %i[male female other]
end

class Survivor < ApplicationRecord
  has_many :item
  has_many :report

  enum gender: %i[male female other]
end

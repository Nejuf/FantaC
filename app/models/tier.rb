class Tier < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { in: 1..30 }
  validates :name, uniqueness: true
end

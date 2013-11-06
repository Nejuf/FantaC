class Affinity < ActiveRecord::Base
  validates :name, presence: true, length: { in: 1..30 }, uniqueness: true

  has_many :characters
end

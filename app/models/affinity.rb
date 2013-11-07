class Affinity < ActiveRecord::Base
  validates :name, presence: true, length: { in: 1..40 }, uniqueness: true

  has_many :characters
end

class Position < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { in: 2..30 }
end

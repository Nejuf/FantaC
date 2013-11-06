class Position < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { in: 2..30 }

  has_many :contest_positions
  # has_many :contests, through: :contest_positions

  has_many :character_entries
  # has_many :characters, through: :character_entries
  # has_many :entries, through: :character_entries
end

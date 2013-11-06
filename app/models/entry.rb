class Entry < ActiveRecord::Base
  validates :user_id, :contest_id, presence: true
  validates :user_id, uniqueness: {scope: :contest_id}

  belongs_to :user
  belongs_to :contest

  has_many :character_entries
  has_many :characters, through: :character_entries
  has_many :positions, through: :character_entries
end

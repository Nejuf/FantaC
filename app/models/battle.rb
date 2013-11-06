class Battle < ActiveRecord::Base
  validates :name, :desc, :start_date, :end_date, presence: true

  validates :name, length: { in: 4..40 }

  belongs_to :user

  has_many :contests
  has_many :battle_rosters
  has_many :characters, through: :battle_rosters
end

class Character < ActiveRecord::Base

  validates :name, :affinity_id, :tier_id,
    :stat_hp, :stat_str, :stat_def,
    :stat_spd, :stat_int, :stat_luck,
    presence: true

  validates :name, length: { in: 1..80 }

  validates  :stat_hp, :stat_str, :stat_def,
    :stat_spd, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize :ensure_defaults

  belongs_to :user
  belongs_to :tier
  belongs_to :affinity

  has_many :battle_rosters
  has_many :battles, through: :battle_rosters

  has_many :character_entries
  has_many :entries, through: :character_entries
  # has_many :positions, through: :character_entries


  def ensure_defaults
    self.name ||= ""
    self.desc ||= ""
    self.stat_hp ||= 0
    self.stat_str ||= 0
    self.stat_def ||= 0
    self.stat_spd ||= 0
  end
end

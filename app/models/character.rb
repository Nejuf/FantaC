class Character < ActiveRecord::Base

  validates :name, :desc, :affinity_id, :tier_id,
    :stat_hp, :stat_str, :stat_def,
    :stat_spd, presence: true

  validates :name, length: { in: 1..40 }

  validates  :stat_hp, :stat_str, :stat_def,
    :stat_spd, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user
  belongs_to :tier
  belongs_to :affinity
end

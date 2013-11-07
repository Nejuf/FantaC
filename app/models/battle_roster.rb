class BattleRoster < ActiveRecord::Base
  validates :character_id, :battle_id, presence: true
  validates :battle_id, uniqueness: { scope: :character_id }
  validates :character_points, numericality: { only_integers: true, greater_than_or_equal_to: 0 }

  after_initialize :ensure_defaults

  belongs_to :battle
  belongs_to :character
  # belongs_to :position

  def ensure_defaults
    self.character_points ||= 0
  end
end

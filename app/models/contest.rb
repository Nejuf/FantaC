class Contest < ActiveRecord::Base
  validates :name, :desc, :points_cap,
  :entry_fee, :payout_type_id, :battle_id,
  presence: true

  validates :name, length: { in: 4..80 }
  validates :points_cap, :entry_fee, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :payout_type
  belongs_to :battle
  belongs_to :category
  belongs_to :user

  has_many :entries
  has_many :contest_positions
  has_many :positions, through: :contest_positions

  def user_entered?(player)
    return true if player && player.contest_ids.include?(self.id)
  end
end

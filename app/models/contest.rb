class Contest < ActiveRecord::Base
  validates :name, :desc, :points_cap,
  :entry_fee, :payout_type_id, :battle_id,
  presence: true

  validates :name, length: { in: 4..40 }
  validates :points_cap, :entry_fee, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :payout_type
  belongs_to :battle
  belongs_to :category

  has_many :entries
  has_many :contest_positions
  has_many :positions, through: :contest_positions
end

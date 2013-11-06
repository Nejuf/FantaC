class Contest < ActiveRecord::Base
  validates :name, :desc, :points_cap,
  :entry_fee, :payout_type_id, :battle_id,
  presence: true

  belongs_to :payout_type
  belongs_to :battle
  belongs_to :category

end

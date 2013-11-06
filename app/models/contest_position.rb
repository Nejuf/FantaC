class ContestPosition < ActiveRecord::Base
  validates :contest_id, :position_id, presence: true
  validates :contest_id, uniqueness: { scope: :position_id }

  belongs_to :contest
  belongs_to :position
end

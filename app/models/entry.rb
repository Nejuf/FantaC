class Entry < ActiveRecord::Base
  validates :user_id, :contest_id, presence: true
  validates :user_id, uniqueness: {scope: :contest_id}

  belongs_to :user
  belongs_to :contest
end

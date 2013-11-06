class Battle < ActiveRecord::Base
  validates :name, :desc, :start_date, :end_date, presence: true

  belongs_to :user

  has_many :contests
end

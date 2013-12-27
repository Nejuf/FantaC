class Series < ActiveRecord::Base
	validates :name, :affinity_id, :desc, presence: true
	validates :name, length: { in: 1..80 }
  validates :name, uniqueness: { scope: :affinity_id }

	belongs_to :affinity
	has_many :characters
end

class Entry < ActiveRecord::Base
  validates :user_id, :contest_id, presence: true
  validates :user_id, uniqueness: {scope: :contest_id}

  after_initialize :ensure_defaults

  belongs_to :user
  belongs_to :contest

  has_many :character_entries
  has_many :characters, through: :character_entries
  has_many :positions, through: :character_entries

  def ensure_defaults
    self.name ||= ""
    self.desc ||= ""
  end
end

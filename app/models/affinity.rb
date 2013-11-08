class Affinity < ActiveRecord::Base
  validates :name, presence: true, length: { in: 1..40 }, uniqueness: true

  has_many :characters

  before_save :normalize

  def self.getIDByName(name)
    if name
      aff = Affinity.find_by(name: name.downcase)
      return aff.id if aff
    end
    nil
  end

  def normalize
    name = name.downcase
  end
end

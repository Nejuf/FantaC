class Affinity < ActiveRecord::Base
  validates :name, presence: true, length: { in: 1..40 }, uniqueness: true

  has_many :characters

  before_save :normalize

  def self.id_by_name(name)
    if name
      aff = Affinity.find_by(name: name.downcase)
      return aff.id if aff
    end
    nil
  end

  def self.id_book
    self.id_by_name("book")
  end
  def self.id_game
    self.id_by_name("game")
  end
  def self.id_film
    self.id_by_name("film")
  end

  def normalize
    self.name ||= ""
    self.name = self.name.downcase
  end
end

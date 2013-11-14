class Battle < ActiveRecord::Base
  validates :name, :desc, :start_date, :end_date, presence: true

  validates :name, length: { in: 4..80 }

  belongs_to :user

  has_many :contests
  has_many :battle_rosters
  has_many :characters, through: :battle_rosters

  #Returns a hash with each participating character's points { "char name": char_points }
  def results
    return {} unless end_passed?

    Rails.cache.fetch("battle_results_" + self.id.to_s) do
      calculate_results
    end
  end

  def end_passed?
    DateTime.parse(self.end_date) > DateTime.now
  end

private

  def calculate_results
    results = {}
    self.battle_rosters.includes(:character).each do |roster|
      roster.character_points = rand(1..100)
      roster.save!
      results[roster.character.name] = roster.character_points
    end
    results
  end
end

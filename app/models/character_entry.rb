class CharacterEntry < ActiveRecord::Base
  validates :character_id, :entry_id, :position_id, presence: true
  validates :entry_id, uniqueness: { scope: :character_id }
  validates :entry_id, uniqueness: { scope: :position_id }

  belongs_to :character
  belongs_to :entry
  belongs_to :position
end

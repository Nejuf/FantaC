class Character < ActiveRecord::Base

  validates :name, :affinity_id, :tier_id,
    :stat_hp, :stat_str, :stat_def,
    :stat_spd, :stat_int, :stat_luck,
    presence: true

  validates :name, length: { in: 1..80 }
  validates :name, uniqueness: { scope: :affinity_id }

  validates  :stat_hp, :stat_str, :stat_def,
    :stat_spd, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize :ensure_defaults
  before_save :on_before_save
  after_save :on_after_save

  belongs_to :user
  belongs_to :tier
  belongs_to :affinity

  has_many :battle_rosters
  has_many :battles, through: :battle_rosters

  has_many :character_entries
  has_many :entries, through: :character_entries
  # has_many :positions, through: :character_entries

  has_many :portraits

  def portrait_main
    self.portraits.first #TODO specify a main portrait
  end

  def image_tag(size=:small, width=0, height=0)
    alt = name
    if portrait_main && portrait_main.portrait_image
      src = portrait_main.portrait_image.url(size)
    else
      src = ENV['MISSING_CHAR_PIC_URL']
    end

    str = '<img'
    if width > 0
      str << " width=\"#{width}\""
    end
    if height > 0
      str << " height=\"#{height}\""
    end
    str << " alt=\"#{alt}\""
    str << " src=\"#{src}\""
    str << '>'

    str.html_safe
  end

  def glyph
    str = case affinity.name
      when "film"
        "film"
      when "game"
        "gamepad"
      when "book"
        "book"
      else
        "question-sign"
    end
    return str
  end

  def ensure_defaults
    self.name ||= ""
    self.desc ||= ""
    self.stat_hp ||= 0
    self.stat_str ||= 0
    self.stat_def ||= 0
    self.stat_spd ||= 0
  end

  def on_before_save
    #normalize name
    self.name = self.name.gsub(/^\s+/, "")
    self.name = self.name.gsub(/\s+$/, "")
    self.name = self.name.gsub(/[_\s]+/, " ")
    self.name = self.name.titleize
  end

  def on_after_save
    if self.portraits.empty?
      po = Portrait.new
      po.character_id = self.id
      po.load_character_default_image!
      po.save
      unless po.errors.messages.empty?
        debugger
        p ""
      end
    end
  end
end

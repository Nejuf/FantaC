require 'open-uri'

class Portrait < ActiveRecord::Base
  #validates :portrait_image, attachment_presence: true

  validates :focusX, :focusY,
          numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :character

  before_save :check_image_dimensions
  before_save :check_for_image_reprocess

  # label: [width, height]
  STYLES = {
    small: [50,50],
    medium: [80,80],
    large: [100,100],
    profile: [180,300]
  }

  STYLE_DEFAULT_URLS = {
    small:  ENV['MISSING_CHAR_PIC_URL'],
    medium:  ENV['MISSING_CHAR_PIC_URL'],
    large:  ENV['MISSING_CHAR_PIC_URL'],
    profile:  ENV['MISSING_CHAR_PIC_URL']
  }

  STYLE_ARGS = lambda { |attachment|
    attachment.instance.check_image_dimensions(attachment)
    fx = attachment.instance.focusX.to_i
    fy = attachment.instance.focusY.to_i
    {
      small: attachment.instance.style_command(:small, fx, fy),
      medium: attachment.instance.style_command(:medium, fx, fy),
      large: attachment.instance.style_command(:large, fx, fy),
      profile: attachment.instance.style_command(:profile, fx, fy)
    }
  }

  def style_command(style, focusX, focusY)
    # widthxheight+x+y#
    STYLES[style][0].to_s + 'x' + STYLES[style][1].to_s + '+' +
    (focusX-STYLES[style][0]/2).floor.to_s + '+' +
    (focusY-STYLES[style][1]/2).floor.to_s + '#'
  end

  has_attached_file :portrait_image,
    styles: STYLE_ARGS,
    processors: [:cropper]


  def check_image_dimensions(attachment=nil)
    attachment ||= self.portrait_image

    if(attachment.respond_to?(:queued_for_write) && attachment.queued_for_write[:original])
      geo = Paperclip::Geometry.from_file(attachment.queued_for_write[:original])
      self.image_width = geo.width.floor
      self.image_height = geo.height.floor
    end

    if self.image_width.nil? || self.image_width < 1
      self.image_width = 1
    end

    if self.image_height.nil? || self.image_height < 1
      self.image_height = 1
    end

    if self.focusX.nil? || (self.focusX < 1) || (self.focusX >= self.image_width)
      self.focusX = (image_width*0.5).floor
    end

    if self.focusY.nil? || (self.focusY < 1) || (self.focusY >= self.image_height)
      self.focusY = (self.image_height*0.2).floor
    end
  end

  def image_tag(size=:small, width=0, height=0)
    alt = character.name
    src = portrait_image.url(size)

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
  end

  def url(style)
    unless STYLES.include?
      raise ArgumentError, "Unrecognized portrait style: #{style}"
    end

    if(portrait_image)
      portrait_image.url(style)
    else
      STYLE_DEFAULT_URLS[style]
    end
  end

  def check_for_image_reprocess()
    if(self.id && (self.changed_attributes.key?("focusX") || self.changed_attributes.key?("focusY")))
      styles = STYLE_ARGS.call self.portrait_image
      style_list = styles.keys
      reprocess_success = self.portrait_image.reprocess(*style_list)
    end
  end

  def self.load_character_default_image!(character)
    char_name = character.name.downcase || "default_char"
    char_name = char_name.gsub(/\s+/, "_")
    affinity = character.affinity_id.to_s || "0"
    url = ENV['DEFAULT_CHAR_PIC_URL'] + char_name + "_" + affinity + '.jpg'
    # io = open(url, 'User-Agent' => 'ruby')
    begin
      l_uri = URI.parse(url)
      io = l_uri.open
    rescue
      p "Portrait Warning: Could not find image from character name: #{char_name} at #{url}"
      begin
        io = open(url, 'User-Agent' => 'ruby')
      rescue
        p "Portrait Warning: Could not find image from character name on second attempt: #{char_name} at #{url}"
        io = open( ENV['MISSING_CHAR_PIC_URL'], 'User-Agent' => 'ruby' )
      end
    end
    return io
  end
end

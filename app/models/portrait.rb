class Portrait < ActiveRecord::Base
  #validates :portrait_image, attachment_presence: true

  # validates :focusX, :focusY,:image_width, :image_height,
  #         numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_save :check_for_image_reprocess

  belongs_to :character

  #First number = width, second number = height
  STYLES = {
    small: [50,50],
    medium: [80,80],
    large: [100,100],
    profile: [180,300]
  }

  STYLE_ARGS = lambda { |attachment|
    fx = attachment.instance.focusX
    fy = attachment.instance.focusY
    {
      small: attachment.instance.style_command(:small, fx, fy),
      medium: attachment.instance.style_command(:medium, fx, fy),
      large: attachment.instance.style_command(:large, fx, fy),
      profile: attachment.instance.style_command(:profile, fx, fy)
    }
  }

  STYLE_DEFAULT_URLS = {
    small: "http://images1.wikia.nocookie.net/__cb20120413002834/creepypasta/images/1/19/Missingno..png",
    medium: "http://images1.wikia.nocookie.net/__cb20120413002834/creepypasta/images/1/19/Missingno..png",
    large: "http://images1.wikia.nocookie.net/__cb20120413002834/creepypasta/images/1/19/Missingno..png",
    profile: "http://images1.wikia.nocookie.net/__cb20120413002834/creepypasta/images/1/19/Missingno..png"
  }

  def style_command(style, focusX, focusY)
    STYLES[style][0].to_s + 'x' + STYLES[style][1].to_s + '+' + 
    (focusX-STYLES[style][0]/2).floor.to_s + '+' + 
    (focusY-STYLES[style][1]/2).floor.to_s + '#'
  end

  has_attached_file :portrait_image,
    styles: STYLE_ARGS,
    processors: [:cropper]



  before_save :save_image_dimensions
  def save_image_dimensions
    if(portrait_image.queued_for_write[:original])
      geo = Paperclip::Geometry.from_file(portrait_image.queued_for_write[:original])
      self.image_width = geo.width.floor
      self.image_height = geo.height.floor
    end
    self.focusX ||= (self.image_width/2).floor
    self.focusY ||= (self.image_height/4).floor
    self.focusX = self.focusX.floor
    self.focusY = self.focusY.floor
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
    if(portrait_image)
      portrait_image.url(style)
    else
      STYLE_DEFAULT_URLS[style]
    end
  end

  def check_for_image_reprocess
    return if @processing_image
    if(changed_attributes.key?("focusX") || changed_attributes.key?("focusY"))
      if portrait_image
        @processing_image = true
        styles = STYLE_ARGS.call portrait_image
        style_list = styles.keys
        portrait_image.reprocess!(*style_list)
      end
    end
  end
end

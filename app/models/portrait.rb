class Portrait < ActiveRecord::Base
  validates :portrait_image, attachment_presence: true

  belongs_to :character

  has_attached_file :portrait_image,
    styles: lambda { |attachment| 
      {
        small: "50x50#",
        medium: "80x80#",
        large: "100x100#",
        profile: "100x250#"
      }
    },
    processors: [:cropper]

  after_post_process :save_image_dimensions

  def save_image_dimensions
    geo = Paperclip::Geometry.from_file(portrait.queued_for_write[:original])
    self.image_width = geo.width
    self.image_height = geo.height
    #TODO need to get all croppings to adjust for focus
  end
# http://stackoverflow.com/questions/4065295/paperclip-saving-the-images-dimensions-width-height
end

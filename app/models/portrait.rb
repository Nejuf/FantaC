class Portrait < ActiveRecord::Base
  validates :portrait_image, attachment_presence: true

  # validates :focusX, :focusY,:image_width, :image_height,
  #         numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :character

  has_attached_file :portrait_image,
    styles: lambda { |attachment|
      fx = attachment.instance.focusX
      fy = attachment.instance.focusY
      {
        small: "50x50+#{fx-25}+#{fy-25}#",
        medium: "80x80+#{fx-40}+#{fy-40}#",
        large: "100x100+#{fx-50}+#{fy-50}#",
        profile: "100x250+#{fx-50}+#{fy-175}#"
      }
    },
    processors: [:cropper]
#     convert_options: lambda{ |attachment|
#       {
#         small: " -crop 50x50+#{attachment.instance.focusX-25}+#{attachment.instance.focusY-25}",
#         medium: " -crop 80x80+#{attachment.instance.focusX-40}+#{attachment.instance.focusY-40}",
#         large: " -crop 100x100+#{attachment.instance.focusX-50}+#{attachment.instance.focusY-50}",
#         profile: " -crop 100x250+#{attachment.instance.focusX-50}+#{attachment.instance.focusY-175}",
#       }
#     }


  before_save :save_image_dimensions

  def save_image_dimensions
    geo = Paperclip::Geometry.from_file(portrait_image.queued_for_write[:original])
    self.image_width = geo.width.floor
    self.image_height = geo.height.floor
    self.focusX ||= 0
    self.focusY ||= 0
    self.focusX = self.focusX.floor
    self.focusY = self.focusY.floor
  end
# http://stackoverflow.com/questions/4065295/paperclip-saving-the-images-dimensions-width-height
# http://stackoverflow.com/questions/4578603/how-do-you-crop-a-specific-area-with-paperclip-in-rails-3
end

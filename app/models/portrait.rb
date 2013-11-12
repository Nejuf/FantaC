class Portrait < ActiveRecord::Base
  validates :portrait_image, attachment_presence: true

  belongs_to :character

  has_attached_file :portrait_image,
    styles: lambda { |attachment| {
      small: "50x50#",
      medium: "80x80#",
      large: "100x100#",
      profile: "100x250#",
      dynamic: "#{attachment.instance.width}x#{attachment.instance.height}#"
    }
    },
    processors: [:cropper]


end

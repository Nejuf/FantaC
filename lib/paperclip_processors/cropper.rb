module Paperclip
  class Cropper < Thumbnail
    def transformation_command
      if crop_command
        crop_command + super.sub(/ -crop \S+/, '')
      else
        super
      end
    end

    def crop_command
      target = @attachment.instance
      crop_width = target.image_width
      crop_height = target.image_height
        " -crop #{crop_width}x#{crop_height}+#{target.crop_x}+#{target.crop_y}"
    end
  end
end
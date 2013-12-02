module Paperclip
  class Cropper < Thumbnail
    def transformation_command
      # crop_command + super.sub(/ -crop \S+/, '')
      c = crop_command
      c || super
    end

    def crop_command
      # target = @attachment.instance
      if options[:geometry][-1,1] == '#'
        match = options[:geometry].match /(\d+)x(\d+)\+(-*\d+)\+(-*\d+)/
        captures = match.captures
        crop_width = captures[0].to_i
        crop_height = captures[1].to_i
        crop_x = captures[2].to_i
        crop_y = captures[3].to_i

        crop_width = [1, crop_width].max
        crop_height = [1, crop_height].max
        crop_x = [0, crop_x].max
        crop_y = [0, crop_y].max

        " -crop #{crop_width}x#{crop_height}+#{crop_x}+#{crop_y}"
      end
    end
  end
end
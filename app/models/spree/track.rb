module Spree
  class Track < Asset

    belongs_to :product
    has_one :metadata

    validates_attachment_presence :attachment
    validate :no_attachment_errors

    # after_post_process :find_media_data


    has_attached_file :attachment,
                      styles: { mini: '48x48>', small: '100x100>', product: '240x240>', large: '600x600>' },
                      default_style: :product,
                      url: '/spree/products/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/products/:id/:style/:basename.:extension'#,
                      #convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

    private

    # def find_media_data
    #   duration_in_seconds = 1.0

    #   temporary = attachment.queued_for_write[:original]
    #   filename = temporary.path unless temporary.nil?
    #   filename = attachment.path if filename.blank?

    #   duration_in_seconds = FFMPEGWrapper.duration_in_seconds(temporary)

    #   self.metadata.duration = duration_in_seconds

    # end

    def no_attachment_errors
      unless attachment.errors.empty?
        # uncomment this to get rid of the less-than-useful interrim messages
        # errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check FFMPEG installation or audio source file."
        false
      end
    end


  end
end
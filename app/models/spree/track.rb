module Spree
  class Track < ActiveRecord::Base
    validates :name, presence: true
    belongs_to :product
    validates_attachment_presence :audio
    validates_attachment_content_type :audio, :content_type => ['audio/wav'],
                                      :message => 'file must be of filetype .wav'

    has_attached_file :audio,
                      url: '/spree/products/:id/:style/:basename.:extension',
                      path: ':rails_root/private/audio/:product_name/:style/:basename.:extension',
                      styles: { mp3: {} },
                      processors: [:ffmpeg_wav_to_mp3]

    Paperclip.interpolates :product_name do |attachment, style|
      attachment.instance.product.name
    end

  end
end
module Spree
  class Track < ActiveRecord::Base
    after_create :create_single

    belongs_to :release
    belongs_to :single

    attr_accessor :available_separately
    attr_accessor :individual_price


    validates :name, presence: true

    validates_attachment_presence :audio
    validates_attachment_content_type :audio, :content_type => ['audio/wav'],
                                      :message => 'file must be of filetype .wav'

    has_attached_file :audio,
                      url: '/spree/products/:id/:style/:basename.:extension',
                      path: ':rails_root/private/audio/:product_name/:style/:basename.:extension',
                      styles: { mp3: { format: 'mp3' } },
                      processors: [:ffmpeg_wav_to_mp3]

    process_in_background :audio

    Paperclip.interpolates :product_name do |attachment, style|
      attachment.instance.product.name
    end

    def product
      self.release
    end

    def create_single
      shipping_category = Spree::ShippingCategory.find_by_name('Spree_Music_Shipping_Category')

      self.single = Spree::Single.create(
        name: self.name,
        price: 1.00,
        shipping_category: shipping_category
      )

      self.single.update(available_on: DateTime.now) if self.available_separately
      self.save
    end

  end
end
module Spree
  class Release < Spree::Product
    after_create :setup_digital_variant

    has_many :tracks,
      -> { order("#{::Spree::Track.quoted_table_name}.position ASC") },
      class_name: 'Spree::Track'

    attr_accessor :artist
    validates :artist, presence: true

    def setup_digital_variant
      Spree::Variant.create(
        product: self,
        sku: self.sku
      ).set_option_value('format', 'digital')
    end

    # So form_for helpers and such work in standard spree
    def self.model_name
      Spree::Product.model_name
    end
  end
end

module Spree
  class Release < Spree::Product
    after_create :setup_digital_variant

    def setup_digital_variant
      Spree::Variant.create(
        product: self,
        # We assume the catalogue number is the
        # same for all formats.
        sku: self.sku
      ).set_option_value('format', 'digital')
    end

    # So form_for helpers and such work in standard spree
    def self.model_name
      Spree::Product.model_name
    end
  end
end

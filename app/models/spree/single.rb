module Spree
  class Single < Spree::Product
    has_one :track, dependent: :destroy

    # So form_for helpers and such work in standard spree
    def self.model_name
      Spree::Product.model_name
    end
  end
end

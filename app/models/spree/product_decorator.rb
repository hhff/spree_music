module Spree
  Product.class_eval do
    has_many :tracks
  end
end
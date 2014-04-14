module Spree
  Product.class_eval do
    has_many :tracks,
      -> { order("#{::Spree::Track.quoted_table_name}.position ASC") },
      inverse_of: :product,
      class_name: 'Spree::Track'

  end
end
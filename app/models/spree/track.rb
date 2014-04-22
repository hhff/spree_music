module Spree
  class Track < ActiveRecord::Base
    validates :name, presence: true
    belongs_to :product
  end
end

module Spree
  class Track < ActiveRecord::Base

    validate :name, presence: true

    belongs_to :product


  end
end
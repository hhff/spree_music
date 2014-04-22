module Spree
  class Metadata < ActiveRecord::Base
    validates :name, presence: true
  end
end

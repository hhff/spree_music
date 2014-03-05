module Spree
  class Tour < ActiveRecord::Base
    validate :name, presence: true
  end
end
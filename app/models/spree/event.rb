module Spree
  class Event < ActiveRecord::Base
    validate :name, presence: true
  end
end
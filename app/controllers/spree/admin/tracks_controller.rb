module Spree
  module Admin
    class TracksController < ResourceController
      belongs_to 'spree/product', :find_by => :slug
    end
  end
end
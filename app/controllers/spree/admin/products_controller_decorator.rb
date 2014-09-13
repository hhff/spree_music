module Spree
  module Admin
    ProductsController.class_eval do

      def new
        if params[:release] == "true"
          @product = @product.becomes Release
          @product.type = @product.class.name
          @prototype = Spree::Prototype.find_by_name('Spree_Music_Prototype')
        end
        super
      end

      def create
        super
        set_artist if @product.class == Spree::Release
      end

      protected

      def set_artist
        artist = params[:product][:artist]
        @product.set_property('artist', artist) if artist
      end
    end
  end
end
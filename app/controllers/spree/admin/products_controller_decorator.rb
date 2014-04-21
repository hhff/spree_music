module Spree
  module Admin
    ProductsController.class_eval do

      def new
        # If we pass :music_product == true, set that variable
        # on the new model, and set the prototype to the music
        # prototype.
        if params[:music_product] == "true"
          @product.music_product = true
          @prototype = Spree::Prototype.find_by_name('Spree_Music_Prototype')
        end
        super
      end

      def create
        super
        # If the newly created product is a music product,
        # automatically create a digital variant.
        if @product.music_product == true
          artist = params[:product][:artist]

          Spree::Variant.create(
            product: @product,
            # We assume the catalogue number is the
            # same for all formats.
            sku: @product.sku
          ).set_option_value('format', 'digital')

          if artist
            @product.set_property('artist', artist)
          end
        end
      end
    end
  end
end
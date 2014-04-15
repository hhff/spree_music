module Spree
  module Admin
    ProductsController.class_eval do

      def new
        # If we pass :music_product == true, set that variable
        # on the new model, and set the prototype to the music
        # prototype.
        if params[:music_product] == "true"
          @product.music_product = true
          @prototype = Spree::Prototype.find_by_name('music_product_prototype')
        end
        super
      end

      def create
        super
        # If the newly created product is a music product,
        # automatically create a digital variant.
        if @product.music_product == true
          Spree::Variant.create(
            product: @product,
          ).set_option_value('format', 'digital')
        end
      end
    end
  end
end
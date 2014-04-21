module Spree
  module Admin
    class TracksController < ResourceController
      before_filter :load_data

      private
        def load_data
          @product = Product.friendly.find(params[:product_id])
          @variants = @product.variants.collect do |variant|
            [variant.sku_and_options_text, variant.id]
          end
          @variants.insert(0, [Spree.t(:all), @product.master.id])
        end

        def location_after_save
          admin_product_tracks_url(@product)
        end

    end
  end
end
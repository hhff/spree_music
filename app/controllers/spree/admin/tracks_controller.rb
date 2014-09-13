module Spree
  module Admin
    class TracksController < ResourceController
      belongs_to 'spree/product', :find_by => :slug
      before_filter :load_data
      # after_filter :zip_audio, :except => [:index, :show, :new, :edit]

      private

      def zip_audio
        @product.zip_audio
      end

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
Deface::Override.new(:virtual_path => 'spree/products/show',
  :name => 'conditionally_add_tracks_to_frontend_product_show',
  :insert_before => "div#cart-form",
  :text => "
    <% if @product.music_product == true %>
      <%= render :partial => 'tracks' %>
    <% end %>
  ")
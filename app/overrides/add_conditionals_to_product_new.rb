Deface::Override.new(:virtual_path => 'spree/admin/products/new',
  :name => 'conditionally_add_checkbox_to_product_new',
  :insert_before => "div.clearfix",
  :text => "
    <% if @product.music_product == true %>
      <%= f.check_box :music_product %>
    <% end %>
  ")


Deface::Override.new(:virtual_path => 'spree/admin/products/new',
  :name => 'conditionally_change_legend_of_product_new',
  :replace => "legend",
  :text => "
    <% if @product.music_product == true %>
      <legend align='center'><%= Spree.t(:new_music_product) %></legend>
    <% else %>
      <legend align='center'><%= Spree.t(:new_product) %></legend>
    <% end %>
  ")

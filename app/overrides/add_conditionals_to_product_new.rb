Deface::Override.new(:virtual_path => 'spree/admin/products/new',
  :name => 'conditionally_add_checkbox_to_product_new',
  :insert_before => "div.clearfix",
  :text => "
    <% if @product.music_product == true %>
      <div class='hidden'>
        <%= f.check_box :music_product %>
      </div>
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


Deface::Override.new(:virtual_path => 'spree/admin/products/new',
  :name => 'conditionally_add_artist_field',
  :insert_before => '[data-hook="new_product_attrs"]',
  :text => "
    <% if @product.music_product == true %>
      <%= f.field_container :artist do %>
        <%= f.label :artist, Spree.t(:artist) %> <span class='required'>*</span><br />
        <%= f.text_field :artist, :class => 'fullwidth title' %>
        <%= f.error_message_on :artist %>
      <% end %>
    <% end %>
  ")

Deface::Override.new(:virtual_path => "spree/admin/products/new",
   :name => "remove_prototype_field",
   :surround => "div.four.columns:nth-child(2)",
   :text => "
   <% unless @product.music_product == true %><%= render_original %><% end %>
  ")

Deface::Override.new(:virtual_path => "spree/admin/products/new",
   :name => "remove_variants_checkboxes",
   :surround => '[data-hook="product-from-prototype"]',
   :text => "
   <% unless @product.music_product == true %><%= render_original %><% end %>
  ")
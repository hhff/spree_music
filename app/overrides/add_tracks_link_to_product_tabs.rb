Deface::Override.new(:virtual_path => 'spree/admin/shared/_product_tabs',
  :name => 'add_tracks_to_product_tabs',
  :insert_before => "erb[loud]:contains('Variants')",
  :text => "
    <%= content_tag :li, :class => ('active' if current == 'Tracks') do %>
      <%= link_to_with_icon 'icon-tasks', Spree.t(:tracks), admin_product_tracks_url(@product) %>
    <% end if can?(:track, Spree::Product) %>
  ")

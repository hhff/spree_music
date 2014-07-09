Deface::Override.new(:virtual_path => 'spree/admin/products/index',
  :name => 'add_new_music_button_to_product_index',
  :replace => "li#new_product_link",
  :text => "
    <li id='new_product_link'>
      <%= button_link_to Spree.t(:new_product), new_object_url, { :remote => false, :icon => 'icon-plus', :id => 'admin_new_product' } %>
    </li>

    <li id='new_music_product_link'>
      <%= button_link_to Spree.t(:new_music_product), new_object_url(music_product: 'true'), { :remote => false, :icon => 'icon-plus', :id => 'admin_new_music_product' } %>
    </li>
  ")

# Setup Format Option Type

puts 'Seeding Spree Music!'

format = Spree::OptionType.create(
          name:         'format',
          presentation: 'Format'
        )

digital = Spree::OptionValue.create(
          name:         'digital',
          presentation: 'Digital'
        )

format.option_values << digital

artist = Spree::Property.create(
          name:         'artist',
          presentation: 'Artist'
        )


music_product_prototype = Spree::Prototype.create(
                            name: 'music_product_prototype'
                          )


music_product_prototype.option_types << format
music_product_prototype.properties << artist


# Shipping Stuff
music_shipping = Spree::ShippingCategory.create(
          name: 'Music_Product_Shipping'
        )

music_location = Spree::StockLocation.create(
          name: 'Music eCom',
          active: true,
          backorderable_default: true,
          propagate_all_variants: true
        )


puts 'Finished Seeding Spree Music!'
SpreeMusic
==========

Introduction goes here.
=======
Spree Music provides your Spree store with functionality for selling Music and music related products, such as tickets and merch.  Suitable for Bands, Record Labels and more.

Installation
------------

Add spree_music to your Gemfile:

```ruby
gem 'spree_digital', :git => 'git://github.com/halo/spree_digital.git', :branch => '2-2-stable'
gem 'spree_music', :git => 'git://github.com/hhff/spree_music.git', :branch => 'master'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_digital:install
bundle exec rails g spree_music:install
bundle exec rake db:seed
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_music/factories'
```

Copyright (c) 2014 Hugh Francis, released under the New BSD License

TODO
-------

Master Digitals should be available always
Cover Image should be included in Download Package
Buy Track Seperately
Tickets
Digital Calculator
Side Jobs for Converting Audio
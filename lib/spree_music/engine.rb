module SpreeMusic
  class Engine < Rails::Engine
    require 'spree/core'
    require 'zip'
    require 'paperclip_processors/ffmpeg_wav_to_mp3'
    require 'sidekiq'
    require 'delayed_paperclip'

    isolate_namespace Spree
    engine_name 'spree_music'

    # Add Type to Product Attributes for STI
    Spree::PermittedAttributes.product_attributes << :type

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    # Add workers to load path
    initializer 'activeservice.autoload', :before => :set_autoload_paths do |app|
      app.config.eager_load_paths << "#{config.root}/app/workers"
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end

require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Shop
  class Application < Rails::Application
    config.load_defaults 5.1

    config.assets.enabled = true
    config.assets.paths << Rails.root.join("/app/assets/fonts")
  end
end

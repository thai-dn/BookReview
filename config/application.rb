require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module BookReview
  class Application < Rails::Application
    config.load_defaults 5.2
    config.assets.initialize_on_precompile = false

    # config.web_console.whitelisted_ips = '192.168.10.0/24'
    # config.web_console.whiny_requests = false
  end
end

require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

Dotenv.load

module BookReview
  class Application < Rails::Application
    config.load_defaults 5.2
    # config.assets.initialize_on_precompile = false
    # config.autoload_paths += Dir["#{config.root}/app/models/ckeditor/*"]

    # config.web_console.whitelisted_ips = '192.168.10.0/24'
    # config.web_console.whiny_requests = false
  end
end

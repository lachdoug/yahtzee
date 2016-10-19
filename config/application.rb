require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Yahtzee
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Devise dependency
    config.action_mailer.default_url_options =
      ENV['RAILS_CONFIG_DEFAULT_URL_OPTIONS']

    config.workshop_key = ENV['RAILS_CONFIG_WORKSHOP_KEY'] || 'dhsvad'
    config.app_host_path =
      (ENV['RAILS_CONFIG_APP_HOST_PATH'] ||
      'http://localhost:3000' ).sub(/[\/]?$/, '')
      # regex matches last character if it's a '/'

  end
end

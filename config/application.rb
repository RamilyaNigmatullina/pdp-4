require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pdp4
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.add_autoload_paths_to_load_path = false

    # Allow host
    config.hosts << /\A([a-z0-9]+\.)?#{ENV.fetch("HOST")}\z/

    # Set default From address for all Mailers
    config.action_mailer.default_options = { from: ENV.fetch("MAILER_SENDER_ADDRESS") }

    # Set URL options to be able to use url_for helpers
    routes.default_url_options = {
      host: ENV.fetch("HOST"),
      protocol: ENV.fetch("PROTOCOL", "http")
    }
    config.action_mailer.default_url_options = routes.default_url_options

    # Whitelist locales available for the application
    config.i18n.available_locales = %i[en]

    # Load all locale files
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]

    # Default locale
    config.i18n.default_locale = :en

    # ActiveJob adapter
    config.active_job.queue_adapter = :sidekiq

    config.active_storage.variant_processor = :vips
  end
end

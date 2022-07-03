require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Phase5Project
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true


      # ▾ Must add these lines! ▾
    # Adding back cookies and session middleware
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    # Use SameSite=Strict for all cookies to help protect against CSRF
    config.action_dispatch.cookies_same_site_protection = :strict

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { 
      :host => '127.0.0.1:3000', 
      :protocol => 'http'
      }
    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                 3000,
      domain:               'example.com',
      user_name:            'genesis.estimator',
      password:             'Inthebeginning07',
      authentication:       'plain',
      enable_starttls_auto: true,
      open_timeout:         5,
      read_timeout:         5 }
  end
end

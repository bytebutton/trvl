require File.expand_path('../boot', __FILE__)
require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

# note: if a patch or an extension relies on constant declared in other files, require those first
Dir[File.expand_path('../extensions/**/*.rb', __FILE__)].sort.each { |f| require f }

module TravelLink
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.eager_load_paths += Dir["#{config.root}/app/models/seed_models/**/"]
    config.autoload_paths   += Dir["#{config.root}/app/models/seed_models/**/"]
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]
    config.autoload_paths   += Dir["#{config.root}/lib/**/"]

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    #config.time_zone = 'UTC'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.enforce_available_locales = false
    config.i18n.default_locale = :en

    # Precompile additional assets.
    # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
    config.assets.precompile += %w(
      *.png *.jpg *.jpeg *.gif
      application.js
      application.css
    )

    config.generators do |g|
      g.test_framework = false
      g.integration_tool = false
      g.helper = true
      g.assets = false
      g.stylesheets = false
    end

    config.action_mailer.default_url_options = Settings.action_mailer.default_url_options.to_hash
    config.cache_store = :redis_store
    config.session_store :redis_store, :key => '_travel-link_session'

  end
end

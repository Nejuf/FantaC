require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Fantac
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: true,
        helper_specs: true,
        routing_specs: true,
        controller_specs: true,
        request_specs: true

      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    AWS.config(access_key_id: Figaro.env.AWS_FANTAC_ACCESS_KEY_ID,
        secret_access_key: Figaro.env.AWS_FANTAC_ACCESS_KEY_SECRET,
        region: Figaro.env.AWS_REGION)

    ENV['DEFAULT_CHAR_PIC_URL'] = "https://s3-us-west-2.amazonaws.com/fantac-public/default_char_pics/"
    ENV['MISSING_CHAR_PIC_URL'] = 'https://s3-us-west-2.amazonaws.com/fantac-public/default_char_pics/default.png'
    # https://s3-us-west-2.amazonaws.com/fantac-public/default_char_pics/jack_sparrow_2.JPG
    # https://s3-us-west-2.amazonaws.com/fantac-public/default_char_pics/link_1.jpg

    ENV['SSL_CERT_FILE'] = "C:/RailsInstaller/cacert.pem"

    # Enables asset pipeline
    config.assets.enabled = true

    #Heroku
    config.assets.initalize_on_precompile = false
    # config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif,
    #                                   "fontawesome-webfont.ttf",
    #                                  "fontawesome-webfont.eot",
    #                                  "fontawesome-webfont.svg",
    #                                  "fontawesome-webfont.woff")

    # config.assets.precompile << Proc.new do |path|
    #       if path =~ /\.(css|js)\z/
    #         full_path = Rails.application.assets.resolve(path).to_path
    #         app_assets_path = Rails.root.join('app', 'assets').to_path
    #         if full_path.starts_with? app_assets_path
    #           puts "including asset: " + full_path
    #           true
    #         else
    #           puts "excluding asset: " + full_path
    #           false
    #         end
    #       else
    #         false
    #       end
    #     end


    #Redis
    if ENV["REDISTOGO_URL"]
      config = RedisDemoApp::Application.config
      uri = URI.parse(ENV["REDISTOGO_URL"])

      config.cache_store = [
        :redis_store, {
          :host => uri.host,
          :port => uri.port,
          :password => uri.password,
          :namespace => "cache"
        }
      ]
    end

  end
end

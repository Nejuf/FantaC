Fantac::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { host: 'localhost:3000'} #from devise
  config.action_mailer.delivery_method = :letter_opener

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  #Bullet
  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    # Bullet.growl = true
    # Bullet.xmpp = { :account  => 'bullets_account@jabber.org',
    #                 :password => 'bullets_password_for_jabber',
    #                 :receiver => 'your_account@jabber.org',
    #                 :show_online_status => true }
    # Bullet.rails_logger = true
    Bullet.airbrake = true
    Bullet.add_footer = true
    Bullet.raise = true
    # Bullet.add_whitelist :type => :n_plus_one_query, :class_name => "Post", :association => :comments
    # Bullet.add_whitelist :type => :unused_eager_loading, :class_name => "Post", :association => :comments
    # Bullet.add_whitelist :type => :counter_cache, :class_name => "Country", :association => :cities
  end

  Paperclip.options[:command_path] = "/opt/local/bin/convert"

  config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => Figaro.env.AWS_FANTAC_PUBLIC_BUCKET_NAME,
      :access_key_id => Figaro.env.AWS_FANTAC_ACCESS_KEY_ID,
      :secret_access_key => Figaro.env.AWS_FANTAC_ACCESS_KEY_SECRET,
      :s3_host_name => Figaro.env.AWS_FANTAC_S3_HOST_NAME
    }
  }

  ENV['APP_ASSET_HOST'] = "https://s3-us-west-2.amazonaws.com/fantac-app/"
  ENV['PUBLIC_ASSET_HOST'] = "https://s3-us-west-2.amazonaws.com/fantac-public/"
  Gon.global.APP_ASSET_HOST = ENV['APP_ASSET_HOST']
  Gon.global.PUBLIC_ASSET_HOST = ENV['PUBLIC_ASSET_HOST']
end

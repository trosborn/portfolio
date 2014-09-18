Portfolio::Application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { :host => 'localhost' }
  config.active_support.deprecation = :log
  config.action_mailer.delivery_method = :letter_opener
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.serve_static_assets = true
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: ENV["GMAIL_DOMAIN"],
    authentication: 'plain',
    enable_starttls_auto: true,
    user_name: ENV["GMAIL_USERNAME"],
    password: ENV["GMAIL_PASSWORD"]
  }
end

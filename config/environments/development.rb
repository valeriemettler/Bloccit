Bloccit::Application.configure do
  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = false

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = true

   config.action_mailer.default_url_options = { host: 'localhost:3000' }
   config.action_mailer.delivery_method = :smtp
   config.action_mailer.perform_deliveries = true
   config.mailer_sender = "valeriemettler@gmail.com"
   config.raise_delivery_errors = true
   
end

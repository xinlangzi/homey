sidekiq_redis = { namespace: "homeyagency-#{Rails.env}" }
Sidekiq.configure_server { |config| config.redis = sidekiq_redis }
Sidekiq.configure_client { |config| config.redis = sidekiq_redis }
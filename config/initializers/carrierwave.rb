CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'AKIAJCECXOTXOZRULRYA',
    aws_secret_access_key: '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',
    region:                'us-west-2',                  # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = "homey.#{Rails.env}"                          # required
  config.fog_use_ssl_for_aws = false

  # config.fog_public     = false                                        # optional, defaults to true
  # config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJZ4IY26MP7IK3MYQ',
    :aws_secret_access_key  => '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',
    :region                 => 'us-east-1',
  }
  config.fog_directory  = 'wwwonder'
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
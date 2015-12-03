CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     Rails.application.secrets.aws_access_key_id,                        # required
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,                        # required
    region:                'eu-central-1',                  # optional, defaults to 'us-east-1'
    #host:                  's3.example.com',             # optional, defaults to nil
    #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  # For testing, upload files to local `tmp` folder.
  #if Rails.env.test? || Rails.env.cucumber?
    #config.storage           = :file
    ##config.root              = "#{Rails.root}/tmp"
  #else
    #config.storage = 'fog/aws'
  #end
  config.fog_directory  = Rails.application.secrets.fog_directory                          # required
  #config.fog_public     = false                                        # optional, defaults to true
  #config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
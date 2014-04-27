# Application Settings for different LIVE/STAGING/DEV/TESTING environments goes here!!!
# This config/app_config.yml file is expected to be hijacked and used by the developers.
# and Symbolic linked in the LIVE SERVER

class AppConfig
  APP_YML_CONFIG = YAML::load(((IO.read("#{Rails.root}/config/app_config.yml"))))

  def self.config
    APP_YML_CONFIG
  end

  def self.is_local?
    self.config['environment']['local_server']
  end

  def self.app
    self.config['app']
  end

  def self.pm_config
    self.config['pm_config']
  end
    
end

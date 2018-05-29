# Load the Rails application.
require_relative 'application'
APP_CONFIG = YAML.load_file("#{Rails.root}/config/local_env.yml")[Rails.env]
# Initialize the Rails application.
Rails.application.initialize!

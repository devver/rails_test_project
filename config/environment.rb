# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

APP_NAME        = "fake_name"
APP_DOMAIN      = "#{APP_NAME.downcase}.com"
DO_NOT_REPLY    = "not_reply_fake <system@#{APP_DOMAIN}>"
GITHUB_GEMS_URL = 'http://gems.github.com'

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"
  #comment
  config.gem 'vlad', :lib => false, :version => '= 1.3.2'
  config.gem 'haml', :version => '>= 2.0.7'
  config.gem 'rspec', :lib => false, :version => '= 1.2.6'
  config.gem 'rspec-rails', :lib => false, :version => '= 1.2.6'
  config.gem 'mocha'
  config.gem 'thoughtbot-factory_girl',
    :lib     => 'factory_girl',
    :source  => "http://gems.github.com",
    :version => '= 1.2.1'
  config.gem 'thoughtbot-paperclip',
    :lib     => 'paperclip',
    :source  => "http://gems.github.com",
    :version => '>= 2.2.6'
  config.gem 'authlogic', :version => '= 1.4.3'
  config.gem 'mislav-will_paginate',
    :lib => 'will_paginate',
    :version => '= 2.3.8',
    :source => 'http://gems.github.com'

  # Tests a HashRocket issue where dependencies were conditionally loaded based
  # on the value of RAILS_ENV.  We should always run in the 'test' environment.
  #
  # Project ID: 63690
  # User:       HashRocket
  # Ticket#:    958
  unless RAILS_ENV == "test"
    raise "RAILS_ENV != 'test'"
  end

  #eugene had the Rails.root problem blow up on him
  #ticket: #1134
  ENV['FAKE_ROOT'] = Rails.root

  #Mike found this caused an error
  #ticket: #1167
  Rails::VendorGemSourceIndex.silence_spec_warnings = true

  #hashrocket l4rk 63694
  ENV['INLINEDIR'] = RAILS_ROOT + "/tmp"

  # ia ia cthulu ftaghn  
  # This gem is specified in gem dependencies AND vendored
  config.gem "arrayfields"

  # This gem is specified in gem dependencies, vendored, and doesn't actually
  # exist on any gem server
  #
  # Ticket #1105
  config.gem "ia-ia-cthulhu-ftaghn"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de

  # The lines below are here to try to break our rails dependency scanning
  rails_root = RAILS_ROOT
  config.load_paths << "#{RAILS_ROOT}/app/middleware"
  config.action_mailer.default_url_options = { :host => APP_DOMAIN }
end

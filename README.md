# Yahtzee

Build a js Yahtzee game. Rails 5 app.

### application.rb
config.app_host_path = ENV['RAILS_CONFIG_APP_HOST_PATH'] e.g "http://localhost:3333"

### Admin
default admin password is 'password'


## The following not needed at this stage

#### Configure the e-mail address which will be shown in Devise::Mailer
ENV['RAILS_DEVISE_CONFIG_MAILER_SENDER'] = 'example@example.com'

#### initializers/devise.rb
config.mailer_sender = ENV['RAILS_DEVISE_CONFIG_MAILER_SENDER']

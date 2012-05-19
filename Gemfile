require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'
gem 'rails', '3.2.3'
gem 'sqlite3'
#gem 'rails-i18n'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem "devise", ">= 2.1.0.rc"
gem "devise_invitable", ">= 1.0.1"
gem "will_paginate", ">= 3.0.3"
gem 'will_paginate-bootstrap'
gem "therubyracer", :group => :assets, :platform => :ruby
gem "haml", ">= 3.1.4"
gem "haml-rails", ">= 0.3.4", :group => :development
gem "bootstrap-sass", ">= 2.0.1"
gem "rspec-rails", ">= 2.9.0.rc2", :group => [:development, :test]
gem "factory_girl_rails", ">= 3.2.0", :group => [:development, :test]
gem "email_spec", ">= 1.2.1", :group => :test
gem "sass", ">= 3.1.12"
gem "simple_form"
gem "capybara", :group => [:development, :test]
gem "guard-bundler", ">= 0.1.3", :group => :development
gem "guard-rails", ">= 0.0.3", :group => :development
gem "guard-rspec", ">= 0.4.3", :group => :development
group :development do
  gem 'capistrano'
  gem 'rvm'
  gem 'rvm-capistrano'
end

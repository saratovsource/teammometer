source 'https://rubygems.org'
#ruby '2.1.1'
gem 'pg'
gem 'rails', '4.1.0'
gem 'rails-observers'
gem 'virtus'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.x'
gem 'jquery-rails'
#gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass'#, '~> 3.1.1.0'
gem "bootstrap_flash_messages"#, "~> 1.0.0"
gem 'figaro'
gem 'haml-rails'
gem 'state_machine'
gem 'simple_form', '~> 3.1.0.rc1'
gem 'therubyracer', :platform=>:ruby
gem 'unicorn'
gem 'unicorn-rails'
gem 'puma'
gem 'will_paginate', '~> 3.0'
# Build JSON APIs with ease.
gem 'active_model_serializers'
gem 'validates'
# Use ActiveModel has_secure_password
gem 'bcrypt-ruby'
gem 'mail_view'
gem 'wisper'
gem 'acts-as-taggable-on'
gem "bower-rails"#, "~> 0.7.3"
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :mri_21, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'ffaker'
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'   # This may or may not work with 2.1.2 either, so remove if you still get errorrs
end
group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end
gem 'rails_12factor', group: :production
gem 'rails_serve_static_assets'

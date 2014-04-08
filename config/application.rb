require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TeamMometer
  class Application < Rails::Application
    config.watchable_dirs['lib'] = [:rb]

    # don't generate RSpec tests for views and helpers
    config.generators do |g|

      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'

      g.view_specs false
      g.helper_specs false

      g.stylesheets false
      g.javascripts false
      g.helper false
    end

    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru
    config.i18n.fallbacks = true
    I18n.enforce_available_locales = true
    config.i18n.available_locales = %w[ru]

    config.action_mailer.default_options = {
      from: "support.temmometer.io"
    }
    config.action_mailer.default_url_options = {
      host: ENV["HOST"]
    }
  end
end

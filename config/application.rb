require_relative 'boot'

require 'rails/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AskMachine
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.precompile += %w( forms/file_input.js )
    config.assets.precompile += %w( custom/signup.css )
    config.assets.precompile += %w( custom/paginate.css )
    config.assets.precompile += %w( custom/question.css )
    config.assets.precompile += %w( custom/qs_index.css )
    config.assets.precompile += %w( forms/answer.js )

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb, yml}').to_s]
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :ru]
  end
end

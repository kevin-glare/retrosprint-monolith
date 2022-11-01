# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'

Bundler.require(*Rails.groups)

module Retrosprint
  class Application < Rails::Application
    config.load_defaults 7.0
    config.hosts << '2c7e-5-18-237-2.ngrok.io'
    config.eager_load_paths << Rails.root.join('lib/modules')

    config.time_zone = 'Europe/Moscow'
    config.active_record.default_timezone = :local

    I18n.load_path += Dir["#{File.expand_path('config/locales')}/*.yml"]
    I18n.available_locales = %i[ru en]
    I18n.default_locale = :ru

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
      g.orm :active_record, foreign_key_type: :uuid
    end

    config.generators.system_tests = nil

    config.log_tags = %i[request_id]
  end
end

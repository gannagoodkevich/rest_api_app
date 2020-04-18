require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module RestRails
  class Application < Rails::Application
    config.load_defaults 6.0

    config.api_only = true

    config.middleware.insert_after ActiveRecord::Migration::CheckPending, ActionDispatch::Cookies
    config.middleware.insert_after ActionDispatch::Cookies, ActionDispatch::Session::CookieStore
  end
end

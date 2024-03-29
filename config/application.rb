require File.expand_path('../boot', __FILE__)

require 'csv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Oamorearesposta
	class Application < Rails::Application

		# set default locale
		config.i18n.default_locale = :'pt-BR'

		config.generators do |g|
			g.test_framework  nil
				# :rspec,
				# fixtures: true,
				# view_specs: false,
				# helper_specs: false,
				# routing_specs: false,
				# controller_specs: false,
				# request_specs: false,
			g.fixture_replacement :factory_bot, dir: "spec/factories"
		end

		# Settings in config/environments/* take precedence over those specified here.
		# Application configuration should go into files in config/initializers
		# -- all .rb files in that directory are automatically loaded.

		# Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
		# Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
		# config.time_zone = 'Central Time (US & Canada)'

		# The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
		config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
		# config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
		# config.i18n.default_locale = :de

		# Do not swallow errors in after_commit/after_rollback callbacks.
		# config.active_record.raise_in_transactional_callbacks = true

		config.assets.paths << Rails.root.join('vendor', 'assets', 'components', 'gentelella', 'production')

		# Globally handle Pundit::NotAuthorizedError's by having rails handle them as a 403 error and serving a 403 error page
		# config.action_dispatch.rescue_responses[ "Pundit::NotAuthorizedError" ] = :forbidden
	end
end

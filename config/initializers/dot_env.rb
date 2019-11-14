# frozen_string_literal: true

Dotenv::Railtie.load if %w[development test].include? ENV['RAILS_ENV']

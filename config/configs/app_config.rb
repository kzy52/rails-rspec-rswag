# frozen_string_literal: true

class AppConfig < ApplicationConfig
  attr_config :application_name,
              :secret_key_base,
              :default_url_host,
              :default_url_port
end

# frozen_string_literal: true

class DbConfig < ApplicationConfig
  attr_config :database_name,
              :database_host,
              :database_user,
              :database_password,
              :database_socket,
              :database_pool
end

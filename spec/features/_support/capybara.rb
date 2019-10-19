require "capybara/rspec"

def app_host_with_port
  "#{ENV.fetch('HOST')}:#{ENV.fetch('PORT')}"
end

Capybara.configure do |config|
  config.exact = false
  config.match = :smart

  config.server = :puma, { Silent: true }

  config.default_driver = :rack_test
  config.javascript_driver = :headless_chrome
  config.default_max_wait_time = 10

  config.asset_host = "http://#{app_host_with_port}"
  config.app_host = "http://#{app_host_with_port}"
  config.server_host = ENV.fetch("HOST")
  config.server_port = ENV.fetch("PORT")
end

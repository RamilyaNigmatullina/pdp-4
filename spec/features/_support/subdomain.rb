def switch_to_subdomain(subdomain)
  Capybara.app_host = app_host(subdomain)
end

def app_host(subdomain)
  subdomain ? "http://#{subdomain}.lvh.me" : "http://lvh.me"
end

Capybara.configure do |config|
  config.always_include_port = true
end

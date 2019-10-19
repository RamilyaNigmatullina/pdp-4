require "selenium/webdriver"

Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: %w[
      headless
      no-sandbox
      window-size=1200,800
      disable-extensions
      ignore-ssl-errors
      proxy-server='direct://'
      proxy-bypass-list=*
    ]
  )

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

RSpec.configure do |config|
  config.with_options(type: :feature) do |feature|
    feature.include Warden::Test::Helpers

    feature.after { Warden.test_reset! }
  end
end

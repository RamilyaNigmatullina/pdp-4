RSpec.configure do |config|
  config.with_options(type: :controller) do |controller|
    controller.include Devise::Test::ControllerHelpers
  end
end

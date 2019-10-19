RSpec.configure do |config|
  config.with_options(type: :feature) do |feature|
    feature.include PageHelpers
    feature.include FixtureHelpers
  end
end

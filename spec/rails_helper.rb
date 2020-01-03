ENV["RAILS_ENV"] ||= "test"
ENV["NODE_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../config/environment", __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"
require "shoulda/matchers"

Dir[Rails.root.join("spec", "_support", "**", "*.rb")].sort.each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = Rails.root.join("spec", "_support", "fixtures")

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.use_transactional_fixtures = true
end

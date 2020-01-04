require "rails_helper"

REQUIRED_PATHS = [
  "spec/features/_support/{helpers,shared}/**/*.rb",
  "spec/features/_support/*.rb"
].freeze

REQUIRED_PATHS.each do |path|
  Dir[Rails.root.join(path)].sort.each { |f| require f }
end

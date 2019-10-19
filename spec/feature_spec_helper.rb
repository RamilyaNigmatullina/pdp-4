require "rails_helper"

REQUIRED_PATHS = [
  "spec/features/_support/{helpers,shared}/**/*.rb",
  "spec/features/_support/*.rb",
  "spec/features/_support/sections/**/*.rb", # Loading "common" sections
  "spec/features/_support/pages/*/**/sections/**/*.rb", # Loading "page-specific" sections
  "spec/features/_support/pages/**/*.rb" # Loading all pages
].freeze

REQUIRED_PATHS.each do |path|
  Dir[Rails.root.join(path)].each { |f| require f }
end

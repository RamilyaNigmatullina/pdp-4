module Helpers
end

Dir[Rails.root.join("spec", "_support", "helpers", "**", "*.rb")].each { |f| require f }

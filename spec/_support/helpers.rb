module Helpers
end

Dir[Rails.root.join("spec", "_support", "helpers", "**", "*.rb")].sort.each { |f| require f }

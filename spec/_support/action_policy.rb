RSpec.configure do |config|
  config.after do
    ActionPolicy::PerThreadCache.clear_all
  end
end

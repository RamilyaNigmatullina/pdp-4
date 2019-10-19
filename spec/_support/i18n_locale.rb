RSpec.configure do |config|
  I18n.available_locales.each do |locale|
    config.around(locale: locale) do |example|
      I18n.with_locale(locale) { example.run }
    end
  end

  config.before do
    I18n.locale = I18n.default_locale
  end
end

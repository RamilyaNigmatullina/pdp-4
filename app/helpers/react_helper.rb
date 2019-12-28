module ReactHelper
  def render_react_component(component, props = {}, options = {})
    props[:locale] = I18n.locale
    options[:prerender] ||= !Rails.env.development?

    react_component(component, props, options)
  end
end

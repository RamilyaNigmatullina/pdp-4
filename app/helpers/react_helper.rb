module ReactHelper
  def render_react_component(component, props = {}, options = {})
    props[:locale] = I18n.locale
    options[:prerender] ||= false

    react_component(component, props, options)
  end
end

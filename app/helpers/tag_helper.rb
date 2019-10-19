module TagHelper
  def html_tag(&block)
    tag.html(lang: I18n.locale, &block)
  end

  def body_tag(&block)
    controller_class = controller_path.tr("/", "_")
    action_class = [controller_class, action_name].join("_")
    body_class = [controller_class, action_class, "#{I18n.locale}_locale"].join(" ")

    tag.body(class: body_class, &block)
  end
end

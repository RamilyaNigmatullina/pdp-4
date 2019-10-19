module ApplicationHelper
  ALERT_CLASS_MAPPING = {
    success: "alert-success",
    notice: "alert-info",
    alert: "alert-danger",
    error: "alert-danger"
  }.freeze

  def flash_class_by(type)
    ALERT_CLASS_MAPPING[type.to_sym]
  end
end

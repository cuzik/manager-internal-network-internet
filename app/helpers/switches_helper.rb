module SwitchesHelper
  def class_color(port)
    if port.editabled?
      "bg-warning"
    else
      port.enabled? ? "bg-success" : "bg-danger"
    end
  end
end

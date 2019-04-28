module PortsHelper
  def class_color_port(port)
    unless port.editable?
      "bg-secondary"
    else
      port.enabled? ? "bg-success" : "bg-danger"
    end
  end

  def icon_port(port)
    unless port.editable?
      "dot-circle"
    else
      port.enabled? ? "play-circle" : "pause-circle"
    end
  end
end

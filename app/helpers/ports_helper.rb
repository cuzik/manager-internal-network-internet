module PortsHelper
  def class_color_port(port)
    unless port.editable?
      "bg-secondary"
    else
      port.enabled? ? "bg-success" : "bg-danger"
    end
  end
end

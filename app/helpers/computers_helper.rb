module ComputersHelper
  def class_color_computer(computer)
    return "bg-white"
    if computer.port.nil?
      "bg-warning"
    else
      if computer.owner?
        "bg-info"
      else
        port.enabled? ? "bg-success" : "bg-danger"
      end
    end
  end
end

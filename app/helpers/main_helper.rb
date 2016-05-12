module MainHelper
  def active_class_name path
    request.path == path ? "active" : ""
  end
end

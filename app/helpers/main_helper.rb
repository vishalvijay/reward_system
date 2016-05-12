module MainHelper
  def active_class_name path
    request.path == path ? "active" : ""
  end

  def error_messages(msg)
    ret = "<ul>"
    if msg.is_a? Array
      if msg.length > 1
        msg.each do |m|
          ret += "<li>#{m}</li>"
        end
      else
        ret += "#{msg[0]}"
      end
    elsif msg.is_a? Hash
      msg.each do |k,v|
        ret += "<li>#{k}: #{v}</li>"
      end
    else
      ret += "#{msg}"
    end
    ret += "</ul>"
    raw(ret)
  end
end

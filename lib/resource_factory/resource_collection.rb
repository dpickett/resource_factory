class ResourceCollection < Array
  class << self
    def build(collection)
      new(collection)
    end
  end
  
  def to_xml
    if self.size > 0
      resource_name = "#{self[0].factory_name.pluralize.dasherize}"
      "<#{resource_name}>" +
      self.collect{|i| i.to_xml}.join("\r\n") +
      "</#{resource_name}>"
    end
  end
end
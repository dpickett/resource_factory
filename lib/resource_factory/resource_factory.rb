class ResourceFactory
  class << self
     attr_accessor :definitions
     
     def define(factory_name)
       default_instance = ResourceFactory.new(factory_name.to_sym)
       yield(default_instance)
       self.definitions ||= {}
       self.definitions[factory_name.to_sym] = default_instance
     end

     def build(factory_name, attrs = {})
       ResourceFactory.new(factory_name, attrs)
     end
     
     
   end
   
  attr_accessor :attributes
  attr_accessor :factory_name
  
  self.definitions = {}
  
  def initialize(factory_name, attributes = {})
    self.attributes = {}
    self.factory_name = factory_name.to_s
    
    if self.class.definitions.has_key?(factory_name)
      self.attributes = 
        self.class.definitions[factory_name].attributes.merge(attributes)
    else
      self.attributes = attributes
    end
  end
  
  def method_missing(possible_name, *args, &block)
    if args.size == 1 && !block_given?
      self.attributes.merge!({possible_name => args[0]})
    end
  end
  
  def to_h
    self.attributes
  end
  
  def to_xml
    element_name = self.factory_name.dasherize
    "<#{element_name}>" +
    self.attributes.keys.collect{|a| get_attribute_xml(a)}.join("\r\n") + 
    "</#{element_name}>"
  end
  
  private
  def get_attribute_xml(attribute)
    if self.attributes[attribute]
      element_name = attribute.to_s.dasherize
      "<#{element_name}>" + self.attributes[attribute] + "</#{element_name}>"
    else
      ""
    end
  end
  
end

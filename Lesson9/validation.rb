module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def validate(name, *args)
      validates = '@@validates'
      class_variable_set(validates, {})
      class_variable_get(validates)[name] = *args
    end
  end

  module InstanceMethods

    def validate!
      self.class.class_variable_get('@@validates').each do |name, args|
        value = instance_variable_get("@#{name}").to_s
        send("validate_#{args[0]}", value, *args[1, args.size])
      end
      true
    end

    def validate_presence(val)
      value = val
      raise 'Argument is empty' if value.nil? || value.empty?
    end

    def validate_format(val, format)
      value = val
      raise "Invalid format" if value !~ format
    end

    def validate_type(val, type)
      type_class = val
      raise "Invalid Type" if type_class != type
    end

    def valid?
      validate!
    rescue ArgumentError
      false
    end
  end
end

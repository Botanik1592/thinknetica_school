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
        send("validate_#{args[0]}", name, *args[1, args.size])
      end
      true
    end

    def validate_presence(name)
      value = instance_variable_get("@#{name}")
      raise 'Argument is empty' if value.nil? || value.empty?
    end

    def validate_format(name, format)
      value = instance_variable_get("@#{name}")
      raise "Invalid format" if value !~ format
    end

    def validate_type(name, type)
      type_class = instance_variable_get("@#{name}").to_s
      raise "Invalid Type" if type_class != type
    end

    def valid?
      validate!
    rescue ArgumentError
      false
    end
  end
end

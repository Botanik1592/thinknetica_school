module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, *args)
      instance_variable_get(@validates)
      instance_variable_set(@validates)[name] = *args
    end
  end

  module InstanceMethods
    def validate!
      @validates.each do |name, args|
        value = instance_variable_get("@#{name}")
        if args[0] == "presence"
          raise "Argument is empty!" if value.nil? || value.empty?
        elif args[0] == "format"
          raise "Invalid format" if value =~ args[1]
        else
          raise "Invalid type" if self.class != args[1]
        end
      end
    end

    def valid?
      validate!
    rescue ArgumentError
      fail
    end
  end
end

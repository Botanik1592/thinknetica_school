module Accessors
  def self.included(base)
    base.extend ClassMethods
    #base.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*args)
      args.each do |name|
        var_name = "@#{name}".to_sym
        var_history = "@#{name}_history".to_sym

        define_method(name) { instance_variable_get(var_name) }

        define_method("#{name}=") do |value|
          instance_variable_get(var_history).nil? ? instance_variable_set(var_history, []) : instance_variable_get(var_history) << instance_variable_get(var_name)
          instance_variable_set(var_name, value)
        end

        define_method("#{name}_history") { instance_variable_get var_history }
      end
    end

    def strong_attr_accessor(name, type)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=") do |value|
        p value.class
        value.class == type ? instance_variable_set(var_name, value) : raise("ClassesMismatch")

      end
    end
  end
end



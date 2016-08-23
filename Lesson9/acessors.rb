module Acessors
def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*args)
      args.each do |name|
        var_name = "@#{name}".to_sym
        define_method(name) { instance_variable_get(var_name)}
        define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value) }
      end
    end
  end

  module InstanceMethods

  end

end

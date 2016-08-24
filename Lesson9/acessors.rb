module Acessors
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  def initialize
    @history = {}
  end

  module ClassMethods
    def attr_accessor_with_history(*args)
      args.each do |name|
        var_name = "@#{name}".to_sym
        var_name_set = "#{name}=".to_sym
        define_method(name) { instance_variable_get(var_name) }

        define_method(var_name_set) do |value|
          instance_variable_set(var_name, value)
          @history[name] ||= []
          @history[name] << value
          add_history_method(name)
        end
      end
    end

    def strong_attr_acessor(name, type)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        "#{value.class}".to_sym == type ? instance_variable_set(var_name, value) : raise("ClassesMismatch")
        end
    end
  end

  module InstanceMethods
    def add_history_method(name)
      define_singleton_method("#{name}_history") { @history[name] }
    end
  end
end

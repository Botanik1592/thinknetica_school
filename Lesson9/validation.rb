module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, *args)
      var_name = "@validates"
      instance_variable_set(var_name)
    end
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @@count ||= 0
    def instances(num=0)
      @@count += num
    end
  end

  module InstanceMethods
    private
    def register_instance
      self.class.instances(1)
    end
  end
end

# Создать модуль InstanceCounter, содержащий следующие методы класса и инстанс-методы, которые подключаются автоматически при вызове include в классе:
#Методы класса:
#       - instances, который возвращает кол-во экземпляров данного класса
#Инастанс-методы:
#       - register_instance, который увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора.
#       При этом данный метод не должен быть публичным.

module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @@count = 0
    def instances
      @@count
    end
  end

  module InstanceMethods
    @@count = 0
    def register_instance
      @@count += 1
    end
  end
end

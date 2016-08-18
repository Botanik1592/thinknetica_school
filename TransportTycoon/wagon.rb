class Wagon
  include Manufacturer
  include InstanceCounter

  def initialize
    register_instance
  end

  protected

  TYPE = { passenger: "пассажирский", cargo: "грузовой" }

end

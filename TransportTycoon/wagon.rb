class Wagon
  include Manufacturer
  include InstanceCounter

  protected

  TYPE = { passenger: "пассажирский", cargo: "грузовой" }

end

require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    if @docked_bikes == []
      raise 'Error: cannot release a bike from an empty Dockingstation'
    else
      @docked_bike
    end
  end

  def dock(bike)
    if @docked_bikes.length >= 20
      raise 'Error: Dockingstation is full'
    else
      @docked_bikes.push(bike)
    end
  end
end

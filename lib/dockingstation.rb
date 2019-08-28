require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    if empty?
      raise 'Error: cannot release a bike from an empty Dockingstation'
    else
      @docked_bike
    end
  end

  def dock(bike)
    if full?
      raise 'Error: Dockingstation is full'
    else
      @docked_bikes.push(bike)
    end
  end

  private

  def full?
    @docked_bikes.length == 20
  end

  def empty?
    @docked_bikes == []
  end

end

require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    if empty?
      raise 'Error: cannot release a bike from an empty Dockingstation'
    else
      @docked_bikes
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
    @docked_bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    @docked_bikes == []
  end

end

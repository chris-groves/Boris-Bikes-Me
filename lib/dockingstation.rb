require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes, :capacity, :docked_working_bikes, :docked_broken_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_working_bikes = []
    @docked_broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    if empty?
      raise 'Error: cannot release a bike from an empty Dockingstation'
    else
      @docked_working_bikes[0]
    end
  end

  def dock(bike)
    if full?
      raise 'Error: Dockingstation is full'
    else
      if bike.broken == true
        @docked_broken_bikes.push(bike)
      else
        @docked_working_bikes.push(bike)
      end
    end
  end

  private

  def full?
    @docked_working_bikes.length + @docked_broken_bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    @docked_working_bikes == []
  end

end

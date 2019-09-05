require_relative 'bike'

class DockingStation
  attr_accessor :capacity, :docked_working_bikes, :docked_broken_bikes

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

  def dock_fixed_bikes(van)
    van.working_bikes.each do |bike|
      @docked_working_bikes.push(bike)
    end
    van.working_bikes.clear
  end



  private

  def full?
    @docked_working_bikes.length + @docked_broken_bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    @docked_working_bikes == []
  end

end

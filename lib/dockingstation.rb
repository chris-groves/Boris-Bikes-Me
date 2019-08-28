require_relative 'bike'

class DockingStation
  attr_reader :docked_bike

  def initialize
    @docked_bike = ''
  end

  def release_bike
    if @docked_bike == ''
      raise 'Error: cannot release a bike from an empty Dockingstation'
    else
      @docked_bike
    end
  end

  def dock(bike)
    @docked_bike = bike
  end
end

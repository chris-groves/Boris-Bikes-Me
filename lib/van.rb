require_relative 'dockingstation'

class Van
  attr_accessor :broken_bikes, :working_bikes

  def initialize
    @broken_bikes = []
    @working_bikes = []
  end

  def collect_broken_bikes(docking_station)
    docking_station.docked_broken_bikes.each do |bike|
      @broken_bikes << bike
      docking_station.docked_broken_bikes.clear
    end
  end

  def collect_working_bikes(garage)
    garage.stored_fixed_bikes.each do |bike|
      @working_bikes << bike
    end
    garage.stored_fixed_bikes.clear
  end
end

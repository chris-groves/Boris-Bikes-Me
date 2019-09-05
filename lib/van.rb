require_relative 'dockingstation'

class Van
  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def collect_broken_bikes(docking_station)
    docking_station.docked_broken_bikes.each do |bike|
      @broken_bikes << bike
      docking_station.docked_broken_bikes.clear
    end
  end
end

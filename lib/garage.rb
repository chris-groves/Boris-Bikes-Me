class Garage
  attr_accessor :stored_broken_bikes, :stored_fixed_bikes

  def initialize
    @stored_broken_bikes = []
    @stored_fixed_bikes = []
  end

  def receive_broken_bikes(van)
    van.broken_bikes.each do |bike|
      @stored_broken_bikes << bike
    end
    van.broken_bikes.clear
  end

  def fix_broken_bikes(stored_broken_bikes)
    stored_broken_bikes.map do |bike|
      bike.fix
      @stored_fixed_bikes.push(bike)
      @stored_broken_bikes.clear
    end
  end
end

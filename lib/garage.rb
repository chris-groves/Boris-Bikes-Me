class Garage
  attr_reader :stored_broken_bikes

  def initialize
    @stored_broken_bikes = []
  end

  def receive_broken_bikes(van)
    van.broken_bikes.each do |bike|
      @stored_broken_bikes << bike
    end
  end
end

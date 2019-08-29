class Bike
  attr_reader :broken

  def initialize
    @broken = false
  end
  
  def working?
    true
  end

  def mark_broken
    @broken = true
  end
end

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

  def fix
    @broken = false
  end
end

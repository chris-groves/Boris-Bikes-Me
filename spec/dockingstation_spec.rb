require 'dockingstation'

describe DockingStation do
  it 'has a capacity which a user can set' do
    expect(subject).to respond_to :capacity
  end

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    it 'responds to release_bike method' do
      expect(subject).to respond_to :release_bike
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq [bike]
    end

    it 'raises an error if dockingstation is empty' do
      expect { subject.release_bike }.to raise_error("Error: cannot release a bike from an empty Dockingstation")
    end
  end

  describe '#working' do
    it 'releases a working bike' do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike
      expect(bike.working?).to eq true
    end
  end

  describe '#dock' do
    it 'stores a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.docked_bikes).to eq [bike]
    end

    it 'raises an error if dockingstation is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock(Bike.new) }.to raise_error("Error: Dockingstation is full")
    end
  end
end

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
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error if dockingstation is empty' do
      expect { subject.release_bike }.to raise_error("Error: cannot release a bike from an empty Dockingstation")
    end

    it 'releases one bike if there are multiple bikes docked' do
        bike = Bike.new
        bike2 = Bike.new
        subject.dock(bike)
        subject.dock(bike2)
        expect(subject.release_bike).to eq bike
    end
  end

  describe '#working' do
    it 'releases a working bike' do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike
      expect(bike.broken).to eq false
    end
  end

  describe '#dock' do
    it 'stores a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.docked_working_bikes).to eq [bike]
    end

    it 'stores broken bikes separately from working bikes' do
      working_bike = Bike.new
      broken_bike = Bike.new
      broken_bike.mark_broken
      subject.dock(working_bike)
      subject.dock(broken_bike)
      expect(subject.docked_working_bikes).to eq [working_bike]
      expect(subject.docked_broken_bikes).to eq [broken_bike]
    end

    it 'raises an error if dockingstation is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock(Bike.new) }.to raise_error("Error: Dockingstation is full")
    end
  end
end

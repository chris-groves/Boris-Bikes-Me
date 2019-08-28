require 'dockingstation'

describe DockingStation do
  describe '#release_bike' do
    it 'responds to release_bike method' do
    expect(subject).to respond_to :release_bike
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike
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
      20.times { subject.dock Bike.new }
      expect { subject.dock(Bike.new) }.to raise_error("Error: Dockingstation is full")
    end
  end
end

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

    it 'raises an error if an attempt is made to release a bike from empty dockingstation' do
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

  it 'responds to a dock method' do
    bike = Bike.new
    expect(subject).to respond_to :dock
  end

  it 'stores a docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.docked_bike).to eq bike
  end


end

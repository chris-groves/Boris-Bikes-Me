require 'dockingstation'

describe DockingStation do
  it 'responds to release_bike method' do
    expect(subject).to respond_to :release_bike
  end

  it 'releases a working bike' do
    bike = subject.release_bike
    expect(bike.working?).to be true
  end

  it 'resonds to a dock method' do
    bike = subject.release_bike
    expect(subject).to respond_to :dock
  end

  it 'stores a docked bike' do
    bike = subject.release_bike
    subject.dock(bike)
    expect(subject.docked_bikes).to eq [bike]
  end

end

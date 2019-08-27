require 'bike'

describe Bike do
  it 'responds to release_bike method' do
    docking_station = DockingStation.new
    expect(subject).to respond_to :working?
  end


end

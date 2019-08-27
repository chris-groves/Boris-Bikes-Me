require 'dockingstation'

describe DockingStation do
  it 'responds to release_bike method' do
    dockingstation = DockingStation.new
    expect(subject).to respond_to :release_bike
  end

end

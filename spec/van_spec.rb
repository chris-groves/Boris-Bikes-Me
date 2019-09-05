require 'dockingstation'
require 'van'

describe Van do

  let(:bike) { double :bike }
  let(:docking_station) { double :docking_station }

  it 'collects broken bikes' do
    docking_station = double("docking_station", :docked_working_bikes => [], :docked_broken_bikes => [bike] )
    subject.collect_broken_bikes(docking_station)
    expect(subject.broken_bikes).to eq [bike]
    expect(docking_station.docked_broken_bikes).to eq []
  end
end

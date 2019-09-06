require 'dockingstation'
require 'van'

describe Van do

  let(:bike) { double :bike }
  let(:docking_station) { double :docking_station }
  let(:garage) { double :garage }

  it 'collects broken bikes from a dockingstation' do
    docking_station = double("docking_station", :docked_working_bikes => [], :docked_broken_bikes => [bike] )
    subject.collect_broken_bikes(docking_station)
    expect(subject.broken_bikes).to eq [bike]
    expect(docking_station.docked_broken_bikes).to eq []
  end

  it 'collects working bikes from a garage' do
    bike = Bike.new
    bike.mark_broken
    docking_station = double("docking_station", :docked_broken_bikes => [bike] )
    subject.collect_broken_bikes(docking_station)
    garage = Garage.new
    garage.receive_broken_bikes(subject)
    garage.fix_broken_bikes(garage.stored_broken_bikes)
    subject.collect_working_bikes(garage)
    expect(subject.working_bikes).to eq [bike]
    expect(garage.stored_fixed_bikes).to eq []
  end

  it 'contains no working bikes once these has been delivered to a dockingstation' do
    garage = double("garage", :stored_fixed_bikes => [bike])
    docking_station = DockingStation.new
    subject.collect_working_bikes(garage)
    docking_station.dock_fixed_bikes(subject)
    expect(subject.working_bikes).to eq []
  end
end

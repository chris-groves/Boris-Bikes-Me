require 'garage'

describe Garage do

  let(:van) { double :van }
  let(:bike) { double :bike }

  it 'receives broken bikes from a van' do
    van = double("van", :broken_bikes => [bike])
    subject.receive_broken_bikes(van)
    expect(subject.stored_broken_bikes).to eq [bike]
    expect(van.broken_bikes).to eq []
  end

  it 'fixes broken bikes' do
    bike = Bike.new
    bike.mark_broken
    van = double("van", :broken_bikes => [bike])
    subject.receive_broken_bikes(van)
    subject.fix_broken_bikes(subject.stored_broken_bikes)
    expect(bike.broken).to eq false
  end

  it 'stores broken bikes separately from fixed bikes' do
    bike = Bike.new
    bike.mark_broken
    van = double("van", :broken_bikes => [bike])
    subject.receive_broken_bikes(van)
    subject.fix_broken_bikes(subject.stored_broken_bikes)
    expect(subject.stored_fixed_bikes).to eq [bike]
    expect(subject.stored_broken_bikes).to eq []
  end
end

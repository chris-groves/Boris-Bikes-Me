require 'garage'

describe Garage do

  let(:van) { double :van }
  let(:bike) { double :bike }

  it 'receives broken bikes from a van' do
    van = double("van", :broken_bikes => [bike])
    subject.receive_broken_bikes(van)
    expect(subject.stored_broken_bikes).to eq [bike]
  end

end

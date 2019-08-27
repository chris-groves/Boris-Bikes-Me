require 'bike'

describe Bike do
  it 'responds to release_bike method' do
    expect(subject).to respond_to :working?
  end


end

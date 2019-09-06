require 'bike'

describe Bike do
  it 'responds to working method' do
    expect(subject).to respond_to :working?
  end

  it 'can be marked as broken' do
    subject.mark_broken
    expect(subject.broken).to eq true
  end

  it 'can be fixed if broken' do
    subject.mark_broken
    subject.fix
    expect(subject.broken).to eq false
  end
end

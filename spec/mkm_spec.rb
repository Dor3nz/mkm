require 'spec_helper'

describe Mkm do

  let(:faraday) { double :faraday }
  before(:each) { described_class.disconnect }

  it 'should connect using the default url' do
    expect(Faraday).to receive(:new).
      with('https://www.mkmapi.eu/ws/v1.1', instance_of(Hash)).
      and_return faraday

    expect(described_class.connect).to be faraday
  end

  it 'should connect using the provided url' do
    provided_url = 'https://www.mkmapi.eu/ws/v1.1/test'

    expect(Faraday).to receive(:new).
      with(provided_url, instance_of(Hash)).
      and_return faraday

    expect(described_class.connect(provided_url)).to be faraday
  end

  it 'should connect and return an instance of Faraday' do
    allow(described_class).to receive(:connect).and_return faraday
    expect(described_class.connection).to be faraday
  end

  it 'should only connect when connection is not set' do
    allow(Faraday).to receive(:new).and_return(faraday)
    expect(described_class).to receive(:connect).once.and_call_original

    2.times { described_class.connection }
  end

end

require 'spec_helper'

describe Mkm do

  let(:faraday) { double :faraday }
  let :params do
    {
      consumer_key: '1234', consumer_secret: '2345',
      token: '3456', token_secret: '4567'
    }
  end
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

    expect(described_class.connect provided_url).to be faraday
  end

  it 'should connect and return an instance of Faraday' do
    allow(described_class).to receive(:connect).
      and_return faraday

    expect(described_class.connection).to be faraday
  end

  it 'should only connect when connection is not set' do
    allow(Faraday).to receive(:new).
      and_return faraday

    expect(described_class).to receive(:connect).
      once.
      and_call_original

    2.times { described_class.connection }
  end

  it 'should try to load ~/.mkmrc if no params are provided' do
    mkmrc_path = File.join ENV['HOME'], '.mkmrc'
    data = Oj.dump params

    allow(File).to receive(:readable?).
      and_return true

    expect(Oj).to receive(:load_file).
      with(mkmrc_path).
      and_return params

    expect(Mkm::Agent).to receive(:new).
      with anything, params

    described_class.auth
  end

  it 'should not try to load ~/.mkmrc if params are provided' do
    expect(described_class).not_to receive(:load_params)
    described_class.auth params
  end

  it 'should fail if no authentication params can be retreived' do
    allow(described_class).to receive(:load_params)
    expect { described_class.auth }.to raise_error(/without params/)
  end

  it 'should fail if authentication params are missing' do
    expect do
      described_class.auth consumer_key: '12345', consumer_secret: '23456'
    end.to raise_error(/missing token/)
  end

  it 'should create a session with an agent' do
    agent   = double :agent
    session = double :session

    allow(described_class::Agent).to receive(:new).
      and_return agent

    expect(described_class::Session).to receive(:new).
      with(agent).
      and_return session

    expect(described_class.auth params).to be session
  end

  it 'should convert Mkm authentication to oauth params' do
    expect(described_class::Agent).to receive(:new).
      with(anything, hash_including(
        consumer_key: '12345', consumer_secret: '23456',
        token: '34567', token_secret: '45678'
      ))

    described_class.auth(
      app_token: '12345', app_secret: '23456',
      access_token: '34567', access_token_secret: '45678'
    )
  end

end

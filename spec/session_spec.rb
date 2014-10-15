require 'spec_helper'

describe Mkm::Session do

  let(:connection) { double :connection, url_prefix: 'https://sandbox.mkmapi.eu/ws/v1.1/output.json' }
  let(:agent) { double :agent }

  before :each do
    allow(Mkm::Agent).to receive(:new).and_return(agent)
  end

  it 'gets itself an agent' do
    expect(Mkm::Agent).to receive(:new).with(connection, {})
    described_class.new connection, {}
  end

  it 'returns an Account with the agent assigned' do
    account = described_class.new(connection, {}).account
    expect(account).to be_an(Mkm::Account)
    expect(account.agent).to be(agent)
  end

end

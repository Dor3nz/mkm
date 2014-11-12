require 'spec_helper'

describe Mkm::Agent do

  let(:connection) { double :connection }
  let(:auth) { double :auth }

  subject { described_class.new connection, auth}

  it 'should request JSON output' do
    allow(subject).to receive(:oauth).and_return auth
    allow(connection).to receive(:url_prefix)

    expect(connection).to receive(:get).
      with('output.json/test', {}, authorization: auth).
      and_return double(:response, body: '')

    subject.get 'test'
  end

end

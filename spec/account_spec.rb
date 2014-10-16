require 'spec_helper'

describe Mkm::Account do

  let(:agent) { double :agent }
  let(:subject) { described_class.new agent }

  before :each do
    allow(agent).to receive(:get).
      with('account').
      and_return samples
  end

  end

  it 'fetch the data when it is required' do
    expect(agent).to receive(:get)
    subject.data
  end

  it 'gets the account id' do
    expect(subject.id).to be(9999)
  end
  it 'gets the account username' do
    expect(subject.username).to eql('Maxi')
  end

  def samples
    json = File.read File.join(File.dirname(__FILE__), "samples", "account.json")
    Oj.load json
  end

end

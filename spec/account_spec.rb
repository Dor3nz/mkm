require 'spec_helper'

describe Mkm::Account do

  let(:agent) { double :agent }
  let(:subject) { described_class.new agent }

  before :each do
    allow(agent).to receive(:get).
      with('account').
      and_return sample_file('account')
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

  def sample_file(name)
    File.read File.join(File.dirname(__FILE__), "samples", "#{ name }.json")
  end

end

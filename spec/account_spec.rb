require 'spec_helper'

describe Mkm::Account do

  let(:agent) { double :agent }
  let(:subject) { described_class.new agent }

  before :each do
    allow(agent).to receive(:get).
      with('account').
      and_return samples
  end

  it 'is a User' do
    expect(subject).to be_a(Mkm::User)
  end

  it 'fetch the data when it is required' do
    expect(agent).to receive(:get)
    subject.data
  end

  {
    balance:  9.45,

    name: Mkm::User::Name.new('Maximilian', 'Mustermann'),
    address: Mkm::User::Address.new(
      "Maximilian Mustermann",
      "c/o Musterfrau",
      "Hauptweg 15",
      "12345", "Berlin",
      "D"
    ),

  }.each do |property, expectation|
    it "gets the account's #{ property }" do
      value = subject.send property
      expect(value).to eql(expectation)
    end
  end

  def samples
    json = File.read File.join(File.dirname(__FILE__), "samples", "account.json")
    Oj.load json
  end

end

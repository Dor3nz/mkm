require 'spec_helper'

describe Mkm::User do

  let(:subject) { described_class.new double(:agent), data }

  {
    id:             9999,
    username:       'Maxi',
    country:        'D',
    commercial:     1,
    commercial?:    true,
    risk:           0,
    risk?:          false,
    reputation:     1,
    shipping_speed: 1,
    sales:          254,
    away?:          false,
    language:       :de
  }.
  each do |property, expectation|
    it "gets the account's #{ property }" do
      value = subject.send property
      expect(value).to eql(expectation)
    end
  end

  it 'returns an blank Name' do
    expect(subject.name).to be_a(Mkm::User::Name)
    expect(subject.name).to be_blank
  end
  it 'returns an blank Address' do
    expect(subject.address).to be_a(Mkm::User::Address)
    expect(subject.address).to be_blank
  end

  def data
    path = File.expand_path File.join(%w[ .. samples seller.json ]), __FILE__
    json = File.read path

    Oj.load(json).fetch 'seller'
  end

end

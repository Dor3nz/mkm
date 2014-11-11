require 'spec_helper'

describe Mkm::Entity::User do

  let(:data) { double :data }
  subject { described_class.new data }

  {
    id:         [ :idUser,         rand(999_999) ],
    username:   [ :username,       "Username #{ Time.now }" ],
    sale_count: [ :sellCount,      rand(99_999) ],
    balance:    [ :accountBalance, (rand * 1000).round(2) ],
    country:    [ :country,        ('A'..'Z').to_a.sample ],
    away?:      [ :onVacation,     rand > 0.5 ]
  }.
  each do |attribute, key_value|
    key, value = key_value

    it "should return data['#{ key }'] as ##{ attribute }" do
      allow(data).to receive(:[]).
        with(key.to_s).
        and_return value

      expect(subject.send attribute).to be value
    end
  end

  it 'should return data["isCommercial"] as Type on #type' do
    type = rand 3

    allow(data).to receive(:[]).
      with('isCommercial').
      and_return type

    expect(subject.type).to be Mkm::Entity::User::Type.
      fetch type
  end

  context described_class::Type do
    it '1st Type to be a private user only' do
      expect(described_class.fetch 0).to be_private
      expect(described_class.fetch 0).not_to be_commercial
      expect(described_class.fetch 0).not_to be_powerseller
    end
    it '2nd Type to be a commercial user only' do
      expect(described_class.fetch 1).not_to be_private
      expect(described_class.fetch 1).to be_commercial
      expect(described_class.fetch 1).not_to be_powerseller
    end
    it '3rd Type to be a powerseller only' do
      expect(described_class.fetch 2).not_to be_private
      expect(described_class.fetch 2).not_to be_commercial
      expect(described_class.fetch 2).to be_powerseller
    end
  end

  it 'should return data["riskGroup"] as Reliability on #reliability' do
    reliability = rand 3

    allow(data).to receive(:[]).
      with('riskGroup').
      and_return reliability

    expect(subject.reliability).to be Mkm::Entity::User::Reliability.
      fetch reliability
  end

  context described_class::Reliability do
    it '1st Reliability to be reliable only' do
      expect(described_class.fetch 0).to be_reliable
      expect(described_class.fetch 0).not_to be_unreliable
      expect(described_class.fetch 0).not_to be_highly_unreliable
    end
    it '2nd Reliability to be unreliable only' do
      expect(described_class.fetch 1).not_to be_reliable
      expect(described_class.fetch 1).to be_unreliable
      expect(described_class.fetch 1).not_to be_highly_unreliable
    end
    it '3rd Reliability to be highly unreliable only' do
      expect(described_class.fetch 2).not_to be_reliable
      expect(described_class.fetch 2).not_to be_unreliable
      expect(described_class.fetch 2).to be_highly_unreliable
    end
  end

  it 'should return data["reputation"] as Reputation on #reputation' do
    reputation = rand 6

    allow(data).to receive(:[]).
      with('reputation').
      and_return reputation

    expect(subject.reputation).to be Mkm::Entity::User::Reputation.
      fetch reputation
  end

  context described_class::Reputation do
    it '1st Reputation to be unknown only' do
      expect(described_class.fetch 0).to be_unknown
      expect(described_class.fetch 0).not_to be_outstanding
      expect(described_class.fetch 0).not_to be_very_good
      expect(described_class.fetch 0).not_to be_good
      expect(described_class.fetch 0).not_to be_average
      expect(described_class.fetch 0).not_to be_bad
    end
    it '2nd Reputation to be outstanding only' do
      expect(described_class.fetch 1).not_to be_unknown
      expect(described_class.fetch 1).to be_outstanding
      expect(described_class.fetch 1).not_to be_very_good
      expect(described_class.fetch 1).not_to be_good
      expect(described_class.fetch 1).not_to be_average
      expect(described_class.fetch 1).not_to be_bad
    end
    it '3rd Reputation to be very good only' do
      expect(described_class.fetch 2).not_to be_unknown
      expect(described_class.fetch 2).not_to be_outstanding
      expect(described_class.fetch 2).to be_very_good
      expect(described_class.fetch 2).not_to be_good
      expect(described_class.fetch 2).not_to be_average
      expect(described_class.fetch 2).not_to be_bad
    end
    it '4th Reputation to be good only' do
      expect(described_class.fetch 3).not_to be_unknown
      expect(described_class.fetch 3).not_to be_outstanding
      expect(described_class.fetch 3).not_to be_very_good
      expect(described_class.fetch 3).to be_good
      expect(described_class.fetch 3).not_to be_average
      expect(described_class.fetch 3).not_to be_bad
    end
    it '5th Reputation to be average only' do
      expect(described_class.fetch 4).not_to be_unknown
      expect(described_class.fetch 4).not_to be_outstanding
      expect(described_class.fetch 4).not_to be_very_good
      expect(described_class.fetch 4).not_to be_good
      expect(described_class.fetch 4).to be_average
      expect(described_class.fetch 4).not_to be_bad
    end
    it '6th Reputation to be bad only' do
      expect(described_class.fetch 5).not_to be_unknown
      expect(described_class.fetch 5).not_to be_outstanding
      expect(described_class.fetch 5).not_to be_very_good
      expect(described_class.fetch 5).not_to be_good
      expect(described_class.fetch 5).not_to be_average
      expect(described_class.fetch 5).to be_bad
    end

  end

  it 'should return data["shipsFast"] as ShippingSpeed on #shipping_speed' do
    shipping_speed = rand 3

    allow(data).to receive(:[]).
      with('shipsFast').
      and_return shipping_speed

    expect(subject.shipping_speed).to be Mkm::Entity::User::ShippingSpeed.
      fetch shipping_speed
  end

  context described_class::ShippingSpeed do
    it '1st ShippingSpeed to be normal only' do
      expect(described_class.fetch 0).to be_normal
      expect(described_class.fetch 0).not_to be_very_fast
      expect(described_class.fetch 0).not_to be_fast
    end
    it '2nd ShippingSpeed to be very fast only' do
      expect(described_class.fetch 1).not_to be_normal
      expect(described_class.fetch 1).to be_very_fast
      expect(described_class.fetch 1).not_to be_fast
    end
    it '3rd ShippingSpeed to be fast only' do
      expect(described_class.fetch 2).not_to be_normal
      expect(described_class.fetch 2).not_to be_very_fast
      expect(described_class.fetch 2).to be_fast
    end
  end

  it 'should have a language'

  it 'should return data["name"] as Name on #name' do
    name = double :name

    allow(data).to receive(:[]).
      with('name').
      and_return name

    expect(subject.name).to eq Mkm::Entity::User::Name.
      new name
  end

  context described_class::Name do

    subject { described_class.new data }

    {
      first: [ :firstName, "Firstname #{ Time.now }" ],
      last:  [ :lastName,  "Lastname #{ Time.now }" ]
    }.
    each do |attribute, key_value|
      key, value = key_value

      it "should return data['#{ key }'] as ##{ attribute }" do
        allow(data).to receive(:[]).
          with(key.to_s).
          and_return value

        expect(subject.send attribute).to be value
      end
    end

  end

  it 'should return data["address"] as Address on #address' do
    address = double :address

    allow(data).to receive(:[]).
      with('address').
      and_return address

    expect(subject.address).to eq Mkm::Entity::User::Address.
      new address
  end

  context described_class::Address do

    subject { described_class.new data }

    {
      name:    [ :name,    "Name #{ Time.now }" ],
      extra:   [ :extra,   "Extra #{ Time.now }" ],
      street:  [ :street,  "Street #{ Time.now }" ],
      zip:     [ :zip,     "Zip #{ Time.now }" ],
      city:    [ :city,    "City #{ Time.now }" ],
      country: [ :country, "Country #{ Time.now }" ]
    }.
    each do |attribute, key_value|
      key, value = key_value

      it "should return data['#{ key }'] as ##{ attribute }" do
        allow(data).to receive(:[]).
          with(key.to_s).
          and_return value

        expect(subject.send attribute).to be value
      end
    end

  end

end

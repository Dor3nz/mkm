require 'spec_helper'

describe Mkm::Entity::User do

  context 'Account' do

    subject { described_class.new sample('account') }

    it 'should have the id 9999' do
      expect(subject.id).to be 9_999
    end

    it 'should have the username Maxi' do
      expect(subject.username).to eq 'Maxi'
    end

    it 'should be a commercial user' do
      expect(subject.type).to be_commercial
    end

    it 'should be reliable' do
      expect(subject.reliability).to be_reliable
    end

    it 'should have an outstanding reputation' do
      expect(subject.reputation).to be_outstanding
    end

    it 'should ship very fast' do
      expect(subject.shipping_speed).to be_very_fast
    end

    it 'should have a sale count of 254' do
      expect(subject.sale_count).to be 254
    end

    it 'should have a balance of 9.45' do
      expect(subject.balance).to be 9.45
    end

    it { is_expected.not_to be_away }

    it 'should have a language'

    it 'should have a name' do
      expect(subject.name).to be_an described_class.const_get :Name
      expect(subject.name).not_to be_blank
    end

    it 'should have an address' do
      expect(subject.address).to be_an described_class.const_get :Address
      expect(subject.address).not_to be_blank
    end

    context described_class.const_get :Name do

      subject { described_class.new sample('account')['name'] }

      it 'should have the first name "Maximilian"' do
        expect(subject.first).to eq 'Maximilian'
      end

      it 'should have the last name "Mustermann"' do
        expect(subject.last).to eq 'Mustermann'
      end


    end
    context described_class.const_get :Address do

      subject { described_class.new sample('account')['address'] }

      it 'should have the name "Maximilian Mustermann"' do
        expect(subject.name).to eq 'Maximilian Mustermann'
      end

      it 'should have the extra "c/o Musterfrau"' do
        expect(subject.extra).to eq 'c/o Musterfrau'
      end

      it 'should have the street "Hauptweg 15"' do
        expect(subject.street).to eq 'Hauptweg 15'
      end

      it 'should have the zip code "12345"' do
        expect(subject.zip).to eq "12345"
      end

      it 'should have the city "Berlin"' do
        expect(subject.city).to eq "Berlin"
      end

      it 'should have the country "D"' do
        expect(subject.country).to eq 'D'
      end


    end
  end

  context 'Commercial Seller' do

    subject { described_class.new sample('seller') }

    it 'should have the id 9999' do
      expect(subject.id).to be 9_999
    end

    it 'should have the username Maxi' do
      expect(subject.username).to eq 'Maxi'
    end

    it 'should be a commercial user' do
      expect(subject.type).to be_commercial
    end

    it 'should be reliable' do
      expect(subject.reliability).to be_reliable
    end

    it 'should have an outstanding reputation' do
      expect(subject.reputation).to be_outstanding
    end

    it 'should ship very fast' do
      expect(subject.shipping_speed).to be_very_fast
    end

    it 'should have a sale count of 254' do
      expect(subject.sale_count).to be 254
    end

    it 'should not have a balance' do
      expect(subject.balance).to be_nil
    end

    it { is_expected.not_to be_away }

    it 'should have a language'

    it 'should have a blank name' do
      expect(subject.name).to be_an described_class.const_get :Name
      expect(subject.name).to be_blank
    end

    it 'should have a blank address' do
      expect(subject.address).to be_an described_class.const_get :Address
      expect(subject.address).to be_blank
    end

  end

end

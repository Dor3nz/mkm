require 'spec_helper'

describe Mkm::Entity::User do

  context 'Account' do

    subject { described_class.new sample('account') }

    it 'should have the id 9999' do
      expect(subject.id).to be 9_999
    end

    it 'should have the username Maxi' do
      expect(subject.username).to be_eql 'Maxi'
    end

    it 'should be a commercial user' do
      expect(subject.type).to be_commercial
    end

    it 'should be reliable' do
      expect(subject.reliability).to be_reliable
    end

    it 'should have a outstanding reputation' do
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

  end

  context 'Commercial Seller' do

    subject { described_class.new sample('seller') }

    it 'should have the id 9999' do
      expect(subject.id).to be 9_999
    end

    it 'should have the username Maxi' do
      expect(subject.username).to be_eql 'Maxi'
    end

    it 'should be a commercial user' do
      expect(subject.type).to be_commercial
    end

    it 'should be reliable' do
      expect(subject.reliability).to be_reliable
    end

    it { is_expected.not_to be_away }

    it 'should have an empty name' do
      expect(subject.name).to be_an described_class.const_get :Name
      expect(subject.name).to be_blank
    end

    it 'should have an empty address' do
      expect(subject.address).to be_an described_class.const_get :Address
      expect(subject.address).to be_blank
    end

    it 'should not have a balance' do
      expect(subject.balance).to be_nil
    end

  end

end

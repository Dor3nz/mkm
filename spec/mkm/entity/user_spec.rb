require 'spec_helper'

describe Mkm::Entity::User do

  context 'Commercial Seller' do

    subject { described_class.new sample('seller') }

    it 'should have the id 9999' do
      expect(subject.id).to be 9_999
    end

    it 'should have the username Maxi' do
      expect(subject.username).to be_eql 'Maxi'
    end

    it { is_expected.to be_commercial }

    def samples
      Oj.load_file File.expand_path '../../../samples/seller.json', __FILE__
    end

  end

end

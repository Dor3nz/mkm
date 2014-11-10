require 'spec_helper'

describe Mkm::Entity::Article do

  context 'example' do

    subject { described_class.new sample('article').first }

    it 'should have the id 142158699' do
      expect(subject.id).to be 142_158_699
    end
    it 'should have the product id 266361' do
      expect(subject.product_id).to be 266_361
    end
    it 'should be uncommented' do
      expect(subject.comment).to be_empty
    end
    it 'should cost 0.02' do
      expect(subject.price).to be 0.02
    end
    it 'should be in excellent condition' do
      expect(subject.condition).to be Mkm::Condition::EXCELLENT
    end
    it 'should be available 3 times' do
      expect(subject.count).to be 3
    end
    it { is_expected.not_to be_reserved }
    it { is_expected.not_to be_foil }
    it { is_expected.not_to be_signed }
    it { is_expected.not_to be_playset }
    it { is_expected.not_to be_altered }
    it { is_expected.not_to be_first_edition }

  end

  context 'reserved example' do

    subject { described_class.new sample('article').last }

    it 'should have the id 139659146' do
      expect(subject.id).to be 139_659_146
    end
    it 'should have the product id 266361' do
      expect(subject.product_id).to be 266_361
    end
    it 'should commented with "Scan available"' do
      expect(subject.comment).to be_eql 'Scan available'
    end
    it 'should cost 0.03' do
      expect(subject.price).to be 0.03
    end
    it 'should be in near mint condition' do
      expect(subject.condition).to be Mkm::Condition::NEAR_MINT
    end
    it 'should be reserved 1 time' do
      expect(subject.count).to be 1
    end
    it { is_expected.to be_reserved }
    it { is_expected.not_to be_foil }
    it { is_expected.not_to be_signed }
    it { is_expected.not_to be_playset }
    it { is_expected.not_to be_altered }
    it { is_expected.not_to be_first_edition }

  end

end

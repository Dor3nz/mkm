require 'spec_helper'

describe 'Mkm::Condition' do

  let!(:described_class) { Mkm::Condition }

  it 'should be comparable' do
    expect(described_class).to be < Comparable
  end

  context 'Mint (M)' do
    subject { described_class.fetch 'M' }
    it 'should be better than all other conditions' do
      expect(subject).to be < Mkm::Condition::NEAR_MINT
      expect(subject).to be < Mkm::Condition::EXCELLENT
      expect(subject).to be < Mkm::Condition::GOOD
      expect(subject).to be < Mkm::Condition::LIGHT_PLAYED
      expect(subject).to be < Mkm::Condition::PLAYED
      expect(subject).to be < Mkm::Condition::POOR
    end
    it 'should return its name as string' do
      expect("#{ subject }").to be_eql('Mint')
    end
  end

  context 'Near Mint (NM)' do
    subject { described_class.fetch 'NM' }
    it 'should be better than EX, GD, LP, PL and poor' do
      expect(subject).to be < Mkm::Condition::EXCELLENT
      expect(subject).to be < Mkm::Condition::GOOD
      expect(subject).to be < Mkm::Condition::LIGHT_PLAYED
      expect(subject).to be < Mkm::Condition::PLAYED
      expect(subject).to be < Mkm::Condition::POOR
    end
    it 'should be worse than M' do
      expect(subject).to be > Mkm::Condition::MINT
    end
    it 'should return its name as string' do
      expect("#{ subject }").to be_eql('Near Mint')
    end
  end

  context 'Excellent (EX)' do
    subject { described_class.fetch 'EX' }
    it 'should be better than GD, LP, PL and Poor' do
      expect(subject).to be < Mkm::Condition::GOOD
      expect(subject).to be < Mkm::Condition::LIGHT_PLAYED
      expect(subject).to be < Mkm::Condition::PLAYED
      expect(subject).to be < Mkm::Condition::POOR
    end
    it 'should be worse than M and NM' do
      expect(subject).to be > Mkm::Condition::MINT
      expect(subject).to be > Mkm::Condition::NEAR_MINT
    end
    it 'should return its name as string' do
      expect("#{ subject }").to be_eql('Excellent')
    end
  end

  context 'Good (GD)' do
    subject { described_class.fetch 'GD' }
    it 'should be better than LP, PL and poor' do
      expect(subject).to be < Mkm::Condition::LIGHT_PLAYED
      expect(subject).to be < Mkm::Condition::PLAYED
      expect(subject).to be < Mkm::Condition::POOR
    end
    it 'should be worse than M, NM and EX' do
      expect(subject).to be > Mkm::Condition::MINT
      expect(subject).to be > Mkm::Condition::NEAR_MINT
      expect(subject).to be > Mkm::Condition::EXCELLENT
    end
    it 'should return its name as string' do
      expect("#{ subject }").to be_eql('Good')
    end
  end

  context 'Light Played (LP)' do
    subject { Mkm::Condition.fetch 'LP' }
    it 'should be better than PL and poor' do
      expect(subject).to be < Mkm::Condition::PLAYED
      expect(subject).to be < Mkm::Condition::POOR
    end
    it 'should be worse than M, NM, EX and GD' do
      expect(subject).to be > Mkm::Condition::MINT
      expect(subject).to be > Mkm::Condition::NEAR_MINT
      expect(subject).to be > Mkm::Condition::EXCELLENT
      expect(subject).to be > Mkm::Condition::GOOD
    end
    it 'should return its name as string' do
      expect("#{ subject }").to be_eql('Light Played')
    end
  end

  context 'Played (PL)' do
    subject { Mkm::Condition.fetch 'PL' }
    it 'should be better than poor' do
      expect(subject).to be < Mkm::Condition::POOR
    end
    it 'should be worse than M, NM, EX, GD and LP' do
      expect(subject).to be > Mkm::Condition::MINT
      expect(subject).to be > Mkm::Condition::NEAR_MINT
      expect(subject).to be > Mkm::Condition::EXCELLENT
      expect(subject).to be > Mkm::Condition::GOOD
      expect(subject).to be > Mkm::Condition::LIGHT_PLAYED
    end
    it 'should return its name as string' do
      expect("#{ subject }").to be_eql('Played')
    end
  end

  context 'Poor' do
    subject { described_class.const_get :POOR }
    it 'should be worse than all other conditions' do
      expect(subject).to be > Mkm::Condition::MINT
      expect(subject).to be > Mkm::Condition::NEAR_MINT
      expect(subject).to be > Mkm::Condition::EXCELLENT
      expect(subject).to be > Mkm::Condition::GOOD
      expect(subject).to be > Mkm::Condition::LIGHT_PLAYED
      expect(subject).to be > Mkm::Condition::PLAYED
    end
    it 'should return its name as string' do
      expect("#{ subject }").to be_eql('Poor')
    end
  end

end

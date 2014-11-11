require 'spec_helper'

describe Mkm::Condition do

  it 'should be comparable' do
    expect(described_class).to be < Comparable
  end
  it 'should be ordered' do
    expect(described_class.fetch 'M').to be < described_class.fetch('NM')
    expect(described_class.fetch 'NM').to be < described_class.fetch('EX')
    expect(described_class.fetch 'EX').to be < described_class.fetch('GD')
    expect(described_class.fetch 'GD').to be < described_class.fetch('LP')
    expect(described_class.fetch 'LP').to be < described_class.fetch('PL')
    expect(described_class.fetch 'PL').to be < described_class.fetch('P')
  end

end

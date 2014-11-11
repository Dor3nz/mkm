require 'spec_helper'

describe Mkm::Service do

  it 'should URI escape objects' do
    expect(described_class.new.e  1 ).to eq '1'
    expect(described_class.new.e '1').to eq '1'
    expect(described_class.new.e ' ').to eq '%20'
    expect(described_class.new.e Object.new).to match /^%23%3CObject:/
  end

end

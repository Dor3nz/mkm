require 'spec_helper'

describe Mkm::Entity do

  it 'should be blank if data is nil' do
    expect(described_class.new nil).to be_blank
  end
  it 'should be blank if data is empty' do
    expect(described_class.new Hash.new).to be_blank
  end
  it 'should not be blank if data is neither nil nor empty' do
    expect(described_class.new foo: 'bar').not_to be_blank
  end

end

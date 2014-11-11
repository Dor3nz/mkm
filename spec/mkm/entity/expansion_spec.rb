require 'spec_helper'

describe Mkm::Entity::Expansion do

  let(:data) { double :expansion }
  subject { described_class.new data }

  it 'should return data["idExpansion"] as #id' do
    id = rand 10_000

    allow(data).to receive(:[]).
      with('idExpansion').
      and_return id

    expect(subject.id).to eq id
  end

  it 'should return data["name"] as #name' do
    name = "Name of expansion #{ Time.now }"

    allow(data).to receive(:[]).
      with('name').
      and_return name

    expect(subject.name).to eq name
  end

  it 'should return data["icon"] as #icon' do
    icon = "Icon of expansion #{ Time.now }"

    allow(data).to receive(:[]).
      with('icon').
      and_return icon

    expect(subject.icon).to eq icon
  end

end

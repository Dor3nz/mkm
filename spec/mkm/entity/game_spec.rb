require 'spec_helper'

describe Mkm::Entity::Game do

  let(:data) { double :data }
  subject { described_class.new data }

  it 'should return data["idGame"] as #id' do
    id = rand 10
    allow(data).to receive(:[]).
      with('idGame').
      and_return id

    expect(subject.id).to be id
  end

  it 'should return data["name"] as #name' do
    name = "Name of game #{ Time.now }"
    allow(data).to receive(:[]).
      with('name').
      and_return name

    expect(subject.name).to be name
  end

end

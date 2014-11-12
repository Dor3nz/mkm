require 'spec_helper'

describe Mkm::Service::AccountManagement do

  let(:agent)   { double :agent }
  let(:data)    { double :data }
  let(:context) { double :context }

  subject { described_class.new context, agent }

  it 'should return an User' do
    allow(data).to receive(:[]).and_return data
    allow(agent).to receive(:get).and_return data

    expect(subject.get_user).to be_a Mkm::Entity::User
  end

  it 'should get the account data' do
    allow(data).to receive(:[]).and_return(data)
    allow(agent).to receive(:get).and_return(data)

    expect(subject.get_user.data).to be data
  end

  it 'should set the vacation state' do
    expect(agent).to receive(:put).with 'account/vacation/true'
    subject.set_vacation true
  end
  it 'should accept non-boolean values when setting vacation state' do
    expect(agent).to receive(:put).with 'account/vacation/true'
    subject.set_vacation 1
  end
  it 'should unset vacation state' do
    expect(agent).to receive(:put).with 'account/vacation/false'
    subject.set_vacation nil
  end

end

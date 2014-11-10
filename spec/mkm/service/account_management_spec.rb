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

  it 'should put the account into vacation' do
    expect(agent).to receive(:put).with 'account/vacation/true'
    subject.set_vacation true
  end

  it 'should update the data' do
    allow(agent).to receive(:get).and_return(data)
    allow(agent).to receive(:put)
    allow(data).to receive(:[]).and_return(data)
    allow(subject.get_user).to receive(:data).and_return(data)

    expect(data).to receive(:[]=).with('onVacation', false)
    subject.set_vacation false
  end

end

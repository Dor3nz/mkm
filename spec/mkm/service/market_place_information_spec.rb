require 'spec_helper'

describe Mkm::Service::MarketPlaceInformation do

  let(:agent)   { double :agent }
  let(:context) { double :context }

  subject { described_class.new context, agent }

  it 'should find user by id' do
    data = sample 'seller'

    expect(agent).to receive(:get).
      with('user/9999').
      and_return 'user' => data

    expect(subject.find_user_by_id 9999).to eq Mkm::Entity::User.new data
  end

  it 'should get games' do
    data = sample('game').first

    expect(agent).to receive(:get).
      with('games').
      and_return 'game' => [data]

    expect(subject.get_games).to eq [ Mkm::Entity::Game.new(data) ]
  end

end

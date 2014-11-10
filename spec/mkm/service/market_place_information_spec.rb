require 'spec_helper'

describe Mkm::Service::MarketPlaceInformation do

  let(:agent)   { double :agent }
  let(:data)    { Hash.new { |h, k| h } }
  let(:context) { double :context }

  subject { described_class.new context, agent }

  it 'should find user by id' do
    user = double :user

    expect(agent).to receive(:get).
      with('user/9999').
      and_return data
    expect(Mkm::Entity::User).to receive(:new).
      with(data).
      and_return user

    expect(subject.find_user_by_id 9999).to be user
  end

  it 'should get games' do
    data = sample('game').first

    expect(agent).to receive(:get).
      with('games').
      and_return 'game' => [data]

    expect(Mkm::Entity::Game).to receive(:new).
      once.
      and_call_original

    games = subject.get_games

    expect(games.length).to be 1
    expect(games.first).to be_a Mkm::Entity::Game
    expect(games.first.data).to eq data
  end

end

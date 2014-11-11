require 'spec_helper'

describe Mkm::Service::MarketPlaceInformation do

  let(:agent)   { double :agent }
  let(:context) { double :context }

  subject { described_class.new context, agent }

  it 'should find user by id' do
    response = sample 'seller'
    allow(agent).to receive(:get).
      with('user/9999').
      and_return 'user' => response

    expect(subject.find_user_by_id 9999).to eq Mkm::Entity::User.new response
  end

  it 'should get games' do
    response = sample 'game'
    allow(agent).to receive(:get).
      with('games').
      and_return 'game' => response

    expect(subject.get_games).to eq response.
      map { |data| Mkm::Entity::Game.new data }
  end

end

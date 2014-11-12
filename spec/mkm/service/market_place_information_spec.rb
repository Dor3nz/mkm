require 'spec_helper'

describe Mkm::Service::MarketPlaceInformation do

  let(:agent)   { double :agent }
  let(:context) { double :context }

  subject { described_class.new context, agent }

  it 'should find user by id' do
    response = sample 'seller'
    user     = Mkm::Entity::User.new response

    allow(agent).to receive(:get).
      with("user/#{ user.id }").
      and_return 'user' => response

    expect(subject.find_user_by_id user.id).to eq user
  end

  it 'should return Game instances from response' do
    response = sample 'game'
    games    = response.map { |data| Mkm::Entity::Game.new data }

    allow(agent).to receive(:get).
      with('games').
      and_return 'game' => response

    expect(subject.get_games).to eq games
  end

  it 'should find expansions by game id' do
    game_id    = rand 10
    response   = Array sample 'expansion'
    expansions = response.map { |data| Mkm::Entity::Expansion.new data }

    allow(agent).to receive(:get).
      with("expansion/#{ game_id }").
      and_return 'expansion' => response

    expect(subject.find_expansions_by_game_id game_id).to eq expansions
  end

  it 'should find expansions by game' do
    game       = double :game, id: rand(10)
    expansions = Array Mkm::Entity::Expansion.new sample 'expansion'

    allow(subject).to receive(:find_expansions_by_game_id).
      with(game.id).
      and_return expansions

    expect(subject.find_expansions_by_game game).to eq expansions
  end

  it 'should find expansion by game id and name' do
    finder    = :find_expansion_by_game_id_and_name
    game_id   = rand 10
    response  = sample 'expansion'
    expansion = Mkm::Entity::Expansion.new response

    allow(agent).to receive(:get).
      with("expansion/#{ game_id }/#{ subject.e expansion.name }").
      and_return 'expansion' => response

    expect(subject.send finder, game_id, expansion.name).to eq expansion
  end

  it 'should find expansion by game and name' do
    finder    = :find_expansion_by_game_and_name
    game      = double :game, id: rand(10)
    expansion = Mkm::Entity::Expansion.new sample 'expansion'

    allow(subject).to receive(:find_expansion_by_game_id_and_name).
      with(game.id, expansion.name).
      and_return expansion

    expect(subject.send finder, game, expansion.name).to eq expansion
  end

  it 'should find products by game id and expansion name' do
    finder         = :find_products_by_game_id_and_expansion_name
    game_id        = rand 10
    expansion_name = "Expansion #{ Time.now }"
    response       = Array sample 'product'
    products       = response.map { |data| Mkm::Entity::Product.new data }

    allow(agent).to receive(:get).
      with("expansion/#{ game_id }/#{ subject.e expansion_name }").
      and_return 'card' => response

    expect(subject.send finder, game_id, expansion_name).to eq products
  end

  it 'should find products by game and expansion' do
    finder    = :find_products_by_game_and_expansion
    game      = double :game, id: rand(10)
    expansion = double :expansion, name: "Expansion #{ Time.now }"
    products  = Array Mkm::Entity::Product.new sample 'product'

    allow(subject).to receive(:find_products_by_game_id_and_expansion_name).
      with(game.id, expansion.name).
      and_return products

    expect(subject.send finder, game, expansion).to eq products
  end

end

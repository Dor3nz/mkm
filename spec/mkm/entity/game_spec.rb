require 'spec_helper'

describe Mkm::Entity::Game do

  context 'Magic the Gathering' do

    subject { described_class.new sample('game')[0] }

    it 'should have the id 1' do
      expect(subject.id).to eq 1
    end
    it 'should have the name "Magic the Gathering"' do
      expect(subject.name).to eq 'Magic the Gathering'
    end

  end

  context 'Yugioh' do

    subject { described_class.new sample('game')[1] }

    it 'should have the id 3' do
      expect(subject.id).to eq 3
    end
    it 'should have the name "Yugioh"' do
      expect(subject.name).to eq 'Yugioh'
    end

  end

  context 'World of Warcraft TCG' do

    subject { described_class.new sample('game')[2] }

    it 'should have the id 2' do
      expect(subject.id).to eq 2
    end
    it 'should have the name "World of Warcraft TCG"' do
      expect(subject.name).to eq 'World of Warcraft TCG'
    end

  end

  context 'The Spoils' do

    subject { described_class.new sample('game')[3] }

    it 'should have the id 5' do
      expect(subject.id).to eq 5
    end
    it 'should have the name "The Spoils"' do
      expect(subject.name).to eq 'The Spoils'
    end

  end

  context 'Telperinquar' do

    subject { described_class.new sample('game')[4] }

    it 'should have the id 4' do
      expect(subject.id).to eq 4
    end
    it 'should have the name "Telperinquar"' do
      expect(subject.name).to eq 'Telperinquar'
    end

  end

end

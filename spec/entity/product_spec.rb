require 'spec_helper'

describe Mkm::Entity::Product do

  subject { described_class.new samples['product'].first }

  it 'should have the id 250553' do
    expect(subject.id).to be 250_553
  end

  it 'should have the meta id 204003' do
    expect(subject.meta_id).to be 204_003
  end

  it 'should have the Snapcaster Mage\'s image' do
    expect(subject.image).to be_eql './img/cards/Innistrad/snapcaster_mage.jpg'
  end

  it 'should have the expansion name set to Innistrad' do
    expect(subject.expansion_name).to be_eql 'Innistrad'
  end

  it 'should have the expansion icon set to 229' do
    expect(subject.expansion_icon).to be 229
  end

  it 'should have the rarity set to Rare' do
    expect(subject.rarity).to be_eql 'Rare'
  end

  it 'should have an article count of 951' do
    expect(subject.article_count).to be 951
  end

  it 'should have a foil count of 105' do
    expect(subject.foil_count).to be 105
  end

  it 'should have translated names' do
    expect(subject.names).to be_kind_of described_class.const_get :Names
  end

  it 'should default to the english name' do
    expected_name = subject.data['name']['1']['productName']
    expect(subject.name).to be expected_name
  end

  it 'should have category set to Magic Single' do
    expect(subject.category.id).to be 1
    expect(subject.category.name).to be_eql 'Magic Single'
  end

  it 'should have prices' do
    expect(subject.prices).to be_kind_of described_class.const_get :Prices
  end

  it 'should count 1 reprint' do
    expect(subject.reprint_count).to be 1
  end

  context described_class.const_get :Names do

    let(:data) { samples['product'].first['name'] }
    subject { described_class.new data }

    it 'should have an english name' do
      expect(subject.en).to be data['1']['productName']
    end
    it 'should have a french name' do
      expect(subject.fr).to be data['2']['productName']
    end
    it 'should have a german name' do
      expect(subject.de).to be data['3']['productName']
    end
    it 'should have a spanish name' do
      expect(subject.es).to be data['4']['productName']
    end
    it 'should have an italian name' do
      expect(subject.it).to be data['5']['productName']
    end
    it 'should not have a simplified chinese name' do
      expect(subject.zh_CN).to be_nil
    end
    it 'should not have a portuguese name' do
      expect(subject.pt).to be_nil
    end
    it 'should not have a russian name' do
      expect(subject.ru).to be_nil
    end
    it 'should not have a korean name' do
      expect(subject.ko).to be_nil
    end
    it 'should not have a traditional chinese name' do
      expect(subject.zh_TW).to be_nil
    end

  end

  context described_class.const_get :Prices do

    let(:data) { samples['product'].first['priceGuide'] }
    subject { described_class.new data }

    it 'should have an average price of 31.8' do
      expect(subject.average).to be 31.8
    end
    it 'should have a max price of 38.85' do
      expect(subject.max).to be 38.85
    end
    it 'should have a min price of 24.49' do
      expect(subject.min).to be 24.49
    end
    it 'should have a low price of 24.49' do
      expect(subject.low).to be 24.49
    end
    it 'should have a foil price of 89.9' do
      expect(subject.foil).to be 89.9
    end
    it 'should not have a trend' do
      expect(subject.trend).to be_nil
    end

  end

  def samples
    path = File.expand_path '../../samples/products.json', __FILE__
    Oj.load File.read(path)
  end

end

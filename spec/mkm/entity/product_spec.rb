require 'spec_helper'

describe Mkm::Entity::Product do

  let(:data) { double :data }
  subject { described_class.new data }

  {
    id:             [ :idProduct,     rand(999_999) ],
    meta_id:        [ :idMetaproduct, rand(999_999) ],
    image:          [ :image,         "Image #{ Time.now }" ],
    expansion_name: [ :expansion,     "Expansion Name #{ Time.now }" ],
    expansion_icon: [ :expIcon,       "Expansion Icon #{ Time.now }" ],
    number:         [ :number,        "#{ rand 444 }" ],
    article_count:  [ :countArticles, rand(999) ],
    foil_count:     [ :countFoils,    rand(999) ],
    reprint_count:  [ :countReprints, rand(999) ]
  }.
  each do |attribute, key_value|
    key, value = key_value

    it "should return data['#{ key }'] as ##{ attribute }" do
      allow(data).to receive(:[]).
        with(key.to_s).
        and_return value

      expect(subject.send attribute).to be value
    end
  end

  it 'should return data["rarity"] as Rarity on #rarity' do
    rarity = [
      'Mythic', 'Rare', 'Special', 'Time Shifted',
      'Uncommon', 'Common', 'Land', 'Token'
    ].sample

    allow(data).to receive(:[]).
      with('rarity').
      and_return rarity

    expect(subject.rarity).to be described_class::Rarity.
      fetch rarity
  end

  context described_class::Rarity do

    it 'should be comparable' do
      expect(described_class).to be < Comparable
    end

    it 'should be ordered' do
      expect(described_class.fetch 'Mythic').to be <
        described_class.fetch('Rare')
      expect(described_class.fetch 'Rare').to be <
        described_class.fetch('Special')
      expect(described_class.fetch 'Special').to be <
        described_class.fetch('Time Shifted')
      expect(described_class.fetch 'Time Shifted').to be <
        described_class.fetch('Uncommon')
      expect(described_class.fetch 'Uncommon').to be <
        described_class.fetch('Common')
      expect(described_class.fetch 'Common').to be <
        described_class.fetch('Land')
      expect(described_class.fetch 'Land').to be <
        described_class.fetch('Token')
    end

  end

  it 'should return data["name"] as Names on #names' do
    names = double :names

    allow(data).to receive(:[]).
      with('name').
      and_return names

    expect(subject.names).to eq described_class::Names.
      new names
  end

  it 'should return the english name by default' do
    names = double :names, en: 'English Name'
    allow(subject).to receive(:names).and_return names

    expect(subject.name).to be names.en
  end

  it 'should return data["category"] as Category on #category' do
    category = double :category

    allow(data).to receive(:[]).
      with('category').
      and_return category

    expect(subject.category).to eq described_class::Category.
      new category
  end

  context described_class::Category do

    subject { described_class.new data }

    {
      id:   [ :idCategory,   rand(99) ],
      name: [ :categoryName, "Name #{ Time.now }" ]
    }.
    each do |attribute, key_value|
      key, value = key_value

      it "should return data['#{ key }'] as ##{ attribute }" do
        allow(data).to receive(:[]).
          with(key.to_s).
          and_return value

        expect(subject.send attribute).to be value
      end
    end

  end

  it 'should return data["priceGuide"] as Prices on #prices' do
    prices = double :prices

    allow(data).to receive(:[]).
      with('priceGuide').
      and_return prices

    expect(subject.prices).to eq described_class::Prices.
      new prices
  end

  context described_class::Prices do

    subject { described_class.new data }

    {
      average: [ :SELL,    (rand * 500).round(2) ],
      max:     [ :AVG,     (rand * 500).round(2) ],
      min:     [ :LOWEX,   (rand * 500).round(2) ],
      low:     [ :LOW,     (rand * 500).round(2) ],
      foil:    [ :LOWFOIL, (rand * 500).round(2) ],
      trend:   [ :TREND,   (rand * 500).round(2) ]
    }.
    each do |attribute, key_value|
      key, value = key_value

      it "should return data['#{ key }'] as ##{ attribute }" do
        allow(data).to receive(:[]).
          with(key.to_s).
          and_return value

        expect(subject.send attribute).to be value
      end
    end

  end

  context described_class::Names do

    let(:language)     { language = Mkm::LANGUAGES.compact.sample }
    let(:translation)  { double :translation }
    let(:translations) { double :translations }
    subject do
      allow(data).to receive(:values).and_return(translations)
      described_class.new data
    end

    it 'should return product name for translation if found' do
      name = double :name

      allow(translation).to receive(:[]).with('productName').and_return name
      allow(translations).to receive(:find).and_return translation

      expect(subject.send language).to be name
    end

    it 'should return nil if no translation can be found' do
      allow(translations).to receive(:find)
      expect(subject.send language).to be_nil
    end

    it 'should search for idLanguage in translations' do
      id = double :id

      allow(translations).to receive(:find).
        and_yield translation
      allow(translation).to receive(:[]).
        with('idLanguage').
        and_return id
      expect(id).to receive(:eql?).
        with Mkm::LANGUAGES.index(language)

      subject.send language
    end

  end

end

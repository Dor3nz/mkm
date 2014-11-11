require 'spec_helper'

describe Mkm::Entity::Article do

  let(:data) { double :data }
  subject { described_class.new data }

  {
    id:             [ :idArticle,      rand(999_999_999) ],
    product_id:     [ :idProduct,      rand(999_999) ],
    comment:        [ :comments,       "Comment #{ Time.now }" ],
    price:          [ :price,          rand ],
    count:          [ :count,          rand(10) ],
    reserved?:      [ :inShoppingCart, rand > 0.5 ],
    foil?:          [ :isFoil,         rand > 0.5 ],
    signed?:        [ :isSigned,       rand > 0.5 ],
    playset?:       [ :isPlayset,      rand > 0.5 ],
    altered?:       [ :isAltered,      rand > 0.5 ],
    first_edition?: [ :isFirstEd,      rand > 0.5 ]
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

  it 'should be in excellent condition' do
    condition = %w[ M NM EX GD LP PL P ].sample

    allow(data).to receive(:[]).
      with('condition').
      and_return condition

    expect(subject.condition).to be Mkm::Condition.fetch condition
  end

end

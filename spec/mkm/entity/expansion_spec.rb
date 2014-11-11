require 'spec_helper'

describe Mkm::Entity::Expansion do

  let(:data) { double :expansion }
  subject { described_class.new data }

  {
    id:   [ :idExpansion, rand(9_999) ],
    name: [ :name,        "Name #{ Time.now }" ],
    icon: [ :icon,        "Icon #{ Time.now }" ]
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

require 'spec_helper'

describe Mkm::Service::StockManagement do

  let(:agent)   { double :agent }
  let(:context) { double :context }

  subject { described_class.new context, agent }

  it 'should return Article instances from response' do
    response = sample 'article'
    allow(agent).to receive(:get).and_return 'article' => response

    expect(subject.get_stock).to eq response.
      map { |data| Mkm::Entity::Article.new data }
  end

end

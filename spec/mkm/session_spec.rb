require 'spec_helper'

describe Mkm::Session do

  let(:agent) { double :agent }

  subject { described_class.new agent }

  {
    account: Mkm::Service::AccountManagement,
    market_place: Mkm::Service::MarketPlaceInformation,
    orders: Mkm::Service::OrderManagement,
    shopping_cart: Mkm::Service::ShoppingCartManipulation,
    stock: Mkm::Service::StockManagement,
    wants: Mkm::Service::WantsListManagement
  }.
  each do |accessor, service|

    it "should initialize #{ service } with self and agent" do
      expect(service).to receive(:new).
        with instance_of(described_class), agent

      described_class.new agent
    end
    it "should return a #{ service } when calling ##{ accessor }" do
      expect(subject.send accessor).to be_a service
    end

  end

end

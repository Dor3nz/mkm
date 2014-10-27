module Mkm
  class Session

    def initialize(agent)
      @account_management         = Service::AccountManagement.new self, agent
      @market_place_information   = Service::MarketPlaceInformation.new self, agent
      @order_management           = Service::OrderManagement.new self, agent
      @shopping_cart_manipulation = Service::ShoppingCartManipulation.new self, agent
      @stock_management           = Service::StockManagement.new self, agent
      @wants_list_management      = Service::WantsListManagement.new self, agent
    end

    def account
      @account_management
    end

    def market_place
      @market_place_information
    end

    def orders
      @order_management
    end

    def shopping_cart
      @shopping_cart_manipulation
    end

    def stock
      @stock_management
    end

    def wants
      @wants_list_management
    end

  end
end

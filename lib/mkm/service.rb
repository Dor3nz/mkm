require 'uri'

module Mkm
  class Service < Struct.new(:context, :agent)

    autoload :AccountManagement,        Mkm / 'service/account_management'
    autoload :MarketPlaceInformation,   Mkm / 'service/market_place_information'
    autoload :OrderManagement,          Mkm / 'service/order_management'
    autoload :ShoppingCartManipulation, Mkm / 'service/shopping_cart_manipulation'
    autoload :StockManagement,          Mkm / 'service/stock_management'
    autoload :WantsListManagement,      Mkm / 'service/wants_list_management'

    def e(string)
      URI.escape string.to_s
    end

  end
end

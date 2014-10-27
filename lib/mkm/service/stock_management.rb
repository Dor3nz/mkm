module Mkm
  class Service::StockManagement < Service

    def get_stock
      agent.get('stock')['article'].map do |data|
        Entity::Article.new data
      end
    end

  end
end

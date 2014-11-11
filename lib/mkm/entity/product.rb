module Mkm
  class Entity::Product < Entity

    autoload :Rarity,   Mkm / 'entity/product/rarity'
    autoload :Category, Mkm / 'entity/product/category'
    autoload :Prices,   Mkm / 'entity/product/prices'
    autoload :Names,    Mkm / 'entity/product/names'

    map id: 'idProduct',
        meta_id: 'idMetaproduct',
        image: 'image',
        expansion_name: 'expansion',
        expansion_icon: 'expIcon',
        number: 'number',
        article_count: 'countArticles',
        foil_count: 'countFoils',
        reprint_count: 'countReprints'

    def names
      @names ||= Names.new data['name']
    end
    def name
      names.en
    end
    alias_method :to_s, :name

    def rarity
      Rarity.fetch data['rarity']
    end

    def category
      @category ||= Category.new data['category']
    end

    def prices
      @prices ||= Prices.new data['priceGuide']
    end

  end
end

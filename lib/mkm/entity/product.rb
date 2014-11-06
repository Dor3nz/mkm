module Mkm
  class Entity::Product < Entity

    map id: 'idProduct',
        meta_id: 'idMetaproduct',
        image: 'image',
        expansion_name: 'expansion',
        expansion_icon: 'expIcon',
        number: 'number',
        rarity: 'rarity',
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

    def category
      @category ||= Category.new data['category']
    end

    def prices
      @prices ||= Prices.new data['priceGuide']
    end

    class Names < Entity
      (LANGUAGES.count - 1).times do |n|
        key = "#{ n + 1 }"
        define_method LANGUAGES[n + 1] do
          if translation = data[key]
            translation['productName']
          end
        end
      end
    end
    class Category < Entity
      map id: 'idCategory', name: 'categoryName'
    end
    class Prices < Entity
      map average: 'SELL',
          max:     'AVG',
          min:     'LOWEX',
          low:     'LOW',
          foil:    'LOWFOIL',
          trend:   'TREND'
    end

  end
end

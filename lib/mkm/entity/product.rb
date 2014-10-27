module Mkm
  class Entity::Product < Entity

    map id: 'idProduct',
        meta_id: 'idMetaproduct',
        image: 'image',
        expansion_name: 'expansion',
        expansion_icon: 'expIcon',
        number: 'number',
        rarity: 'rarity',
        articles: 'countArticles',
        foils: 'countFoils'

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

    def reprints
      @reprints ||= Array.new data['countReprints'] do |n|
        Reprint.new data.fetch('reprint', [])[n]
      end
    end

    class Names < Entity
      (LANGUAGES.count - 2).times do |n|
        key = "#{ n + 1 }"
        define_method LANGUAGES[n + 1] do
          data[key]['productName']
        end
      end
    end
    class Category < Entity
      map id: 'idCategory', name: 'categoryName'
    end
    class Prices < Entity
      # {"SELL"=>0.16, "LOW"=>0.05, "LOWEX"=>0, "LOWFOIL"=>0, "AVG"=>0, "TREND"=>0.2}
      map average: 'SELL',
          max:     'AVG',
          min:     'LOWEX',
          low:     'LOW',
          foil:    'LOWFOIL',
          trend:   'TREND'
    end
    class Reprint < Entity
      map id: 'idProduct',
          expansion_name: 'expansion',
          expansion_icon: 'expIcon'
    end

  end
end

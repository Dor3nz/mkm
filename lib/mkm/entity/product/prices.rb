module Mkm
  class Entity::Product::Prices < Entity
    map average: 'SELL',
        max:     'AVG',
        min:     'LOWEX',
        low:     'LOW',
        foil:    'LOWFOIL',
        trend:   'TREND'
  end
end

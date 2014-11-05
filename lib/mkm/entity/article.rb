module Mkm
  class Entity::Article < Entity

    map id: 'idArticle',
        product_id: 'idProduct',
        comment: 'comments',
        price: 'price'

    # TODO Implement a Language class
    def language
      fail NotImplementedError
    end

    # TODO Implement and return a proxy
    def seller
      fail NotImplementedError
    end

    # RADAR Really only set for single articles?
    def condition
      Condition.fetch data['condition']
    end

    # The count key represents has different semantics depending on the request
    # the entity was the response to:
    # * the amount of available articles, taking into account:
    #   * same seller
    #   * same price
    #   * same condition, if applicable
    #   * same additional properties (isFoil, isSigned, isAltered, isPlayset, isFirstEd)
    # * the amount of that article in the shopping cart (as part of a reservation)
    # * the amount of that articel in an order
    #
    # TODO implement context specific getter
    def count
      data['count']
    end

    def reserved?
      data['inShoppingCart']
    end

    def foil?
      data['isFoil']
    end

    def signed?
      data['isSigned']
    end

    def playset?
      data['isPlayset']
    end

    def altered?
      data['isAltered']
    end

    def first_edition?
      data['isFirstEd']
    end
  end
end

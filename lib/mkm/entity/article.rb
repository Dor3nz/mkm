module Mkm
  class Entity::Article < Entity

    map id: 'idArticle',
        product_id: 'idProduct',
        comment: 'comments',
        price: 'price'

    def language
      fail NotImplementedError
    end

    def seller
      fail NotImplementedError
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

    # RADAR Really only set for single articles?
    def condition
      data['condition']
    end

    def reserved?
      data['in_shopping_cart']
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

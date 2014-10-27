module Mkm
  class Entity::User < Entity

    PRIVATE_USER    = 0
    COMMERCIAL_USER = 1
    POWERSELLER     = 2

    NO_RISK         = 0
    LOW_RISK        = 1
    HIGH_RISK       = 2

    UNKNOWN         = 0
    OUTSTANDING     = 1
    VERY_GOOD       = 2
    GOOD            = 3
    AVERAGE         = 4
    BAD             = 5

    NORMAL_SPEED    = 0
    VERY_FAST       = 1
    FAST            = 2

    map id:             'idUser',
        username:       'username',
        type:           'isCommercial',
        reliability:    'riskGroup',
        reputation:     'reputation',
        shipping_speed: 'shipsFast',
        sales:          'sellCount',
        balance:        'accountBalance'

    # TODO return country code
    def country
      data['country']
    end

    def commercial?
      type != PRIVATE_USER
    end
    def reliable?
      reliability == NO_RISK
    end
    def away?
      data['onVacation']
    end

    def language
      raise NotImplementedError
    end

    def name
      @name ||= Name.new data['name']
    end
    def address
      @address ||= Address.new data['address']
    end

    class Name < Entity
      map first: 'firstName', last: 'lastName'
    end
    class Address < Entity
      map name: 'name',
          extra: 'extra',
          street: 'street',
          zip: 'zip', city: 'city',
          country: 'country'
    end

  end
end

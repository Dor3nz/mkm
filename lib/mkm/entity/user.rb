module Mkm
  class Entity::User < Entity

    autoload :ShippingSpeed, Mkm / 'entity/user/shipping_speed'
    autoload :Type,          Mkm / 'entity/user/type'
    autoload :Reliability,   Mkm / 'entity/user/reliability'
    autoload :Reputation,    Mkm / 'entity/user/reputation'
    autoload :Name,          Mkm / 'entity/user/name'
    autoload :Address,       Mkm / 'entity/user/address'

    map id:             'idUser',
        username:       'username',
        sale_count:     'sellCount',
        balance:        'accountBalance'

    # TODO return country code
    def country
      data['country']
    end

    def away?
      data['onVacation']
    end

    def language
      raise NotImplementedError
    end

    def type
      @type ||= Type.fetch data['isCommercial']
    end

    def reliability
      @reliability ||= Reliability.fetch data['riskGroup']
    end

    def reputation
      @reputation ||= Reputation.fetch data['reputation']
    end

    def shipping_speed
      @shipping_speed ||= ShippingSpeed.fetch data['shipsFast']
    end

    def name
      @name ||= Name.new data['name']
    end
    def address
      @address ||= Address.new data['address']
    end

  end
end

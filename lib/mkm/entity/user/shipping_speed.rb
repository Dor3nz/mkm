module Mkm
  class Entity::User::ShippingSpeed < Struct.new(:value)

    @instances = []

    def self.register(value)
      @instances[value] = new value
    end
    def self.fetch(value)
      @instances[value]
    end

    NORMAL_SPEED = register 0
    VERY_FAST    = register 1
    FAST         = register 2

    def normal?
      self == NORMAL
    end
    def fast?
      self == FAST
    end
    def very_fast?
      self == VERY_FAST
    end

  end
end

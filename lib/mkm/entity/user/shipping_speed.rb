module Mkm
  class Entity::User::ShippingSpeed < Struct.new(:value)

    @instances = []

    def self.register
      @instances[@instances.count] = new @instances.count
    end
    def self.fetch(value)
      @instances[value]
    end

    NORMAL    = register
    VERY_FAST = register
    FAST      = register

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

module Mkm
  class Entity::User::ShippingSpeed < Struct.new(:value)

    @instances = []

    def self.register(value)
      @instances[value] = new value
    end
    def self.register_next
      register @instances.count
    end
    def self.fetch(value)
      @instances[value]
    end

    NORMAL    = register_next
    VERY_FAST = register_next
    FAST      = register_next

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

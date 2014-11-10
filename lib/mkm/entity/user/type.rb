module Mkm
  class Entity::User::Type < Struct.new(:value)

    @instances = []

    def self.register(value)
      @instances[value] = new value
    end
    def self.fetch(value)
      @instances[value]
    end

    PRIVATE_USER    = register 0
    COMMERCIAL_USER = register 1
    POWERSELLER     = register 2

    def private?
      self == PRIVATE_USER
    end
    def commercial?
      self == COMMERCIAL_USER
    end
    def powerseller?
      self == POWERSELLER
    end

  end
end

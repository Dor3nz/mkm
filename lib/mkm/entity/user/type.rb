module Mkm
  class Entity::User::Type < Struct.new(:value)

    @instances = []

    def self.register
      @instances[@instances.count] = new @instances.count
    end
    def self.fetch(value)
      @instances[value]
    end

    PRIVATE_USER    = register
    COMMERCIAL_USER = register
    POWERSELLER     = register

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

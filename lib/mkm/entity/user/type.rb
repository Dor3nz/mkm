module Mkm
  class Entity::User::Type < Struct.new(:value)

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

    PRIVATE_USER    = register_next
    COMMERCIAL_USER = register_next
    POWERSELLER     = register_next

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

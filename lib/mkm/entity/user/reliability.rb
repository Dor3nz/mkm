module Mkm
  class Entity::User::Reliability < Struct.new(:value)

    @instances = []

    def self.register(value)
      @instances[value] = new value
    end
    def self.fetch(value)
      @instances[value]
    end

    RELIABLE          = register 0
    UNRELIABLE        = register 1
    HIGHLY_UNRELIABLE = register 2

    def reliable?
      self == RELIABLE
    end
    def unreliable?
      self == UNRELIABLE
    end
    def highly_unreliable?
      self == HIGHLY_UNRELIABLE
    end

  end
end

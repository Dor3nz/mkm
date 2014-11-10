module Mkm
  class Entity::User::Reputation < Struct.new(:value)

    @instances = []

    def self.register(value)
      @instances[value] = new value
    end
    def self.fetch(value)
      @instances[value]
    end

    UNKNOWN     = register 0
    OUTSTANDING = register 1
    VERY_GOOD   = register 2
    GOOD        = register 3
    AVERAGE     = register 4
    BAD         = register 5

    def unknown?
      self == UNKOWN
    end
    def outstanding?
      self == OUTSTANDING
    end
    def very_good?
      self == VERY_GOOD
    end
    def good?
      self == GOOD
    end
    def average?
      self == AVERAGE
    end
    def bad?
      self == BAD
    end

  end
end

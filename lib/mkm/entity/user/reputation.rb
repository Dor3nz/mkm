module Mkm
  class Entity::User::Reputation < Struct.new(:value)

    @instances = []

    def self.register
      @instances[@instances.count] = new @instances.count
    end
    def self.fetch(value)
      @instances[value]
    end

    UNKNOWN     = register
    OUTSTANDING = register
    VERY_GOOD   = register
    GOOD        = register
    AVERAGE     = register
    BAD         = register

    def unknown?
      self == UNKNOWN
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

module Mkm
  class Entity::User::Reputation < Struct.new(:value)

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

    UNKNOWN     = register_next
    OUTSTANDING = register_next
    VERY_GOOD   = register_next
    GOOD        = register_next
    AVERAGE     = register_next
    BAD         = register_next

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

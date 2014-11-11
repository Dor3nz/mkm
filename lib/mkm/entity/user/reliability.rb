module Mkm
  class Entity::User::Reliability < Struct.new(:value)

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

    RELIABLE          = register_next
    UNRELIABLE        = register_next
    HIGHLY_UNRELIABLE = register_next

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

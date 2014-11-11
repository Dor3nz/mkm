module Mkm
  class Entity::User::Reliability < Struct.new(:value)

    @instances = []

    def self.register
      @instances[@instances.count] = new @instances.count
    end
    def self.fetch(value)
      @instances[value]
    end

    RELIABLE          = register
    UNRELIABLE        = register
    HIGHLY_UNRELIABLE = register

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

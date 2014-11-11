module Mkm
  class Entity::Product::Rarity < Struct.new(:name, :value)
    include Comparable

    @instances = {}

    def self.register(name)
      @instances[name] = new name, @instances.count
    end
    def self.fetch(name)
      @instances.fetch name
    end

    MYTHIC       = register 'Mythic'
    RARE         = register 'Rare'
    SPECIAL      = register 'Special'
    TIME_SHIFTED = register 'Time Shifted'
    UNCOMMON     = register 'Uncommon'
    COMMON       = register 'Common'
    LAND         = register 'Land'
    TOKEN        = register 'Token'

    def <=>(other)
      value <=> other.value
    end
    alias_method :to_s, :name

  end
end

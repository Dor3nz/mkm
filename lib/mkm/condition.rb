module Mkm
  class Condition < Struct.new(:value, :name, :abbr)
    include Comparable

    @instances = {}

    def self.register(name: nil, abbr: nil)
      @instances[abbr] = new @instances.count, name, abbr
    end

    MINT         = register name: 'Mint', abbr: 'M'
    NEAR_MINT    = register name: 'Near Mint', abbr: 'NM'
    EXCELLENT    = register name: 'Excellent', abbr: 'EX'
    GOOD         = register name: 'Good', abbr: 'GD'
    LIGHT_PLAYED = register name: 'Light Played', abbr: 'LP'
    PLAYED       = register name: 'Played', abbr: 'PL'
    POOR         = register name: 'Poor'

    def self.fetch(abbr)
      @instances.fetch abbr
    end

    def <=>(other)
      value <=> other.value
    end
    alias_method :to_s, :name
  end
end

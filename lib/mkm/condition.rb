module Mkm
  class Condition < Struct.new(:abbr, :value)
    include Comparable

    @instances = {}

    def self.register(abbr)
      @instances[abbr] = new abbr, @instances.count
    end

    MINT         = register 'M'
    NEAR_MINT    = register 'NM'
    EXCELLENT    = register 'EX'
    GOOD         = register 'GD'
    LIGHT_PLAYED = register 'LP'
    PLAYED       = register 'PL'
    POOR         = register 'P'

    def self.fetch(abbr)
      @instances.fetch abbr
    end

    def <=>(other)
      value <=> other.value
    end
    alias_method :to_s, :abbr
  end
end

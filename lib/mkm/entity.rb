module Mkm
  class Entity < Struct.new(:data)

    autoload :User,      Mkm / 'entity/user'
    autoload :Game,      Mkm / 'entity/game'
    autoload :Expansion, Mkm / 'entity/expansion'
    autoload :Product,   Mkm / 'entity/product'
    autoload :Article,   Mkm / 'entity/article'

    def self.map(mapping)
      mapping.each do |attr, key|
        define_method(attr) { data[key] }
      end
    end

    def blank?
      data.nil? || data.empty?
    end

  end
end

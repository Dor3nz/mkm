module Mkm
  class User < Base

    PRIVATE_USER    = 0
    COMMERCIAL_USER = 1
    POWERSELLER     = 2

    NO_RISK         = 0
    LOW_RISK        = 1
    HIGH_RISK       = 2

    UNKNOWN         = 0
    OUTSTANDING     = 1
    VERY_GOOD       = 2
    GOOD            = 3
    AVERAGE         = 4
    BAD             = 5

    NORMAL_SPEED    = 0
    VERY_FAST       = 1
    FAST            = 2

    LANGUAGES = [ nil, :en, :fr, :de, :es, :it ]

    def id
      data['idUser']
    end
    def username
      data['username']
    end
    # TODO return country code
    def country
      data['country']
    end
    def commercial
      data['isCommercial']
    end
    def commercial?
      commercial != PRIVATE_USER
    end
    def risk
      data['riskGroup']
    end
    def risk?
      risk != NO_RISK
    end
    def reputation
      data['reputation']
    end
    def shipping_speed
      data['shipsFast']
    end
    def sales
      data['sellCount']
    end
    def away?
      data['onVacation']
    end
    def language
      LANGUAGES.at data['idDisplayLanguage']
    end

    def name
      @name ||= Name.build data['name']
    end
    def address
      @address ||= Address.build data['address']
    end

    module Valuable
      def self.included(base)
        base.extend ClassMethods
      end
      def blank?
        not values.any?
      end
      module ClassMethods
        def build(data)
          unless data then new else new *map(data) end
        end
      end
    end

    class Name < Struct.new(:first, :last)
      include Valuable
      def self.map(data)
        return data['firstName'], data['lastName']
      end
    end
    class Address < Struct.new(:name, :extra, :street, :zip, :city, :country)
      include Valuable
      def self.map(data)
        return data.values_at('name', 'extra', 'street', 'zip', 'city', 'country')
      end
    end

  end
end

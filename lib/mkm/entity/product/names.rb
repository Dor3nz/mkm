module Mkm
  class Entity::Product::Names < Entity
    (LANGUAGES.count - 1).times do |n|
      id = n + 1

      define_method LANGUAGES[id] do
        translation = data.values.find do |values|
          values['idLanguage'].eql? id
        end
        translation ? translation['productName'] : nil
      end
    end
  end
end

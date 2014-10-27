module Mkm
  class Assortments < Struct.new(:agent)

    def articles
      @articles ||= agent.get('stock')['article'].map { |data| AssortmentArticle.new agent, data }
    end

  end
end

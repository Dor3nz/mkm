module Mkm
  class AssortmentArticle < Article

    def product
      @product ||= Product.new agent, data['product'].merge(
        'idProduct' => product_id,
        'name' => [
          'productName' => data['product']['name'],
          'idLanguage' => data['language']['idLanguage'],
          'languageName' => data['language']['languageName']
        ]
      )
    end

    def updated_at
      @updated_at ||= Time.parse data['lastEdited']
    end

  end
end

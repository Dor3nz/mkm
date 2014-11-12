module Mkm
  class Service::MarketPlaceInformation < Service

    def find_user_by_id(id)
      data = agent.get('user/%i' % id)['user']
      Entity::User.new data
    end

    def get_games
      agent.get('games')['game'].map do |data|
        Entity::Game.new data
      end
    end

    def find_expansions_by_game_id(id)
      agent.get('expansion/%i' % id)['expansion'].map do |data|
        Entity::Expansion.new data
      end
    end

    def find_expansions_by_game(game)
      find_expansions_by_game_id game.id
    end

    def find_expansion_by_game_id_and_name(id, name)
      data = agent.get('expansion/%i/%s' % [ id, e(name) ])['expansion']
      Entity::Expansion.new data
    end

    def find_expansion_by_game_and_name(game, name)
      find_expansion_by_game_id_and_name game.id, name
    end

    def find_products_by_game_id_and_expansion_name(id, name)
      agent.get('expansion/%i/%s' % [ id, e(name) ])['card'].map do |data|
        Entity::Product.new data
      end
    end

    def find_products_by_game_and_expansion(game, expansion)
      find_products_by_game_id_and_expansion_name game.id, expansion.name
    end

    def find_product_by_id(id)
      data = agent.get('product/%i' % id)['product']
      Entity::Product.new data
    end

    def find_product_by_article(article)
      find_product_by_id article.product_id
    end

    def find_articles_by_product_id(id)
      agent.get('articles/%i' % id)['article'].map do |data|
        Entity::Article.new data
      end
    end

    def find_articles_by_product(product)
      find_articles_by_product_id product.id
    end

  end
end

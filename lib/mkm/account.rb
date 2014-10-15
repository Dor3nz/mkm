module Mkm
  class Account < Client

    def data
      @data ||= begin
        response = agent.get 'account'
        parse response, 'account'
      end
    end

    def id
      data['idUser']
    end

    def username
      data['username']
    end

  end
end

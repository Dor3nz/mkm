module Mkm
  class Session

    attr_reader :account

    def initialize(connection, authentication)
      @agent = Agent.new connection, authentication
      @account = Account.new @agent
    end

  end
end

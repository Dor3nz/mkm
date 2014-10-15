module Mkm
  class Session

    def initialize(connection, authentication)
      @agent = Agent.new connection, authentication
    end
    def account
      @account ||= Account.new @agent
    end

  end
end

module Mkm
  class Account < User

    def balance
      data['accountBalance']
    end

    private

      def __load
        self.data = agent.get('account').fetch 'account'
      end

  end
end

module Mkm
  class Service::AccountManagement < Service

    def get_user
      @user ||= Entity::User.new agent.get('account')['account']
    end

    def set_vacation(boolean)
      agent.put "account/vacation/#{ !! boolean }"
      @user.data['onVacation'] = boolean if @user
    end

  end
end

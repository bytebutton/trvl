module UserKeeper
  extend ActiveSupport::Concern

  included do
    SYSTEM_USER_EMAIL = 'admin@admin.com'

    class << self
      # thread-safe getter (as implemented in https://github.com/stffn/declarative_authorization)
      def current
        Thread.current[:current_user]
      end
      alias :current_user :current

      # thread-safe setter (as implemented in https://github.com/stffn/declarative_authorization)
      def current=(user)
        Thread.current[:current_user] = user
      end
      alias :current_user= :current=

      def system_user
        where({:email => SYSTEM_USER_EMAIL}).first
      end
    end

  end

end

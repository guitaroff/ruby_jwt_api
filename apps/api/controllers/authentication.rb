module Api::Controllers
  module Authentication
    def self.included(base)
      base.class_eval do
        before :logins!
        #before :authenticate!
        #expose :current_user

        # attr_accessor :auth_handler
      end
    end

    # def authentication_handler
    #   self.auth_handler || Efco::Interactors::Users::JWTAuth.new
    # end

    module Skip
      def authenticate!
        # kek
      end
    end

    private

    def logins!
      @logins = {
        user1: '123456',
        user2: '123456',
        user3: '123456'
      }
    end

    # def authenticate!
    #   @current_user ||= authenticate_user
    #   render_error code: 401, status: 'unauthorized' unless !!@current_user
    # end

    # def auth_token
    #   params.env.fetch('HTTP_AUTHORIZATION', '').sub('Bearer ', '')
    # end

    # def authenticate_user
    #   result = authentication_handler.call(auth_token)
    #   if result.success?
    #     result.user
    #   else
    #     nil
    #   end
    # end
  end
end

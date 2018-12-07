module Api::Controllers
  module Authentication
    def self.included(base)
      base.class_eval do
        before :logins!
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
  end
end

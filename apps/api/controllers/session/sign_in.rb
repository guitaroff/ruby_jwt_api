module Api
  module Controllers
    module Session
      class SignIn
        include Api::Action

        params do
          required(:sign_in).schema do
            required(:username).filled(:str?)
            required(:password).filled(:str?)
          end
        end

        def call(params)
          username = params[:sign_in][:username]
          password = params[:sign_in][:password]
          puts "PARAMS: #{params.to_h}"

          #self.body = { message: "You logged in. Yay you!" }.to_json
          # if username == password
          #   self.body = { message: "You logged in. Yay you!" }.to_json
          # else
          #   halt 401
          # end

          if @logins[username.to_sym] == password
            self.body = { message: "You logged in. Yay you!" }.to_json
          else
            halt 401
          end

          # if @logins[username.to_sym] == password
          #   content_type :json
          #   { token: token(username) }.to_json
          # else
          #   halt 401
          # end
        end

        # def token username
        #   JWT.encode payload(username), ENV['JWT_SECRET'], 'HS256'
        # end

        # def payload username
        #   {
        #     exp: Time.now.to_i + 60 * 60,
        #     iat: Time.now.to_i,
        #     iss: ENV['JWT_ISSUER'],
        #     scopes: ['add_money', 'remove_money', 'view_money'],
        #     user: {
        #       username: username
        #     }
        #   }
        # end
      end
    end
  end
end

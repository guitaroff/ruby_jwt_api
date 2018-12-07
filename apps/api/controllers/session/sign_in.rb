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

          if @logins[username.to_sym] == password
            self.body = { token: token(username) }.to_json
          else
            halt 401
          end
        end

        def token username
          JWT.encode payload(username), ENV['JWT_SECRET'], 'HS256'
        end

        def payload username
          {
            exp: Time.now.to_i + 60 * 60,
            sub: username,
            jti: SecureRandom.uuid
          }
        end
      end
    end
  end
end

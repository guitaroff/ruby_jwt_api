module Api
  module Controllers
    module Home
      class Index
        include Api::Action

        def call(params)
          self.body = { message: "Hello, World!" }.to_json
        end
      end
    end
  end
end

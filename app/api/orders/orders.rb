require 'grape'

module API
  class Orders < Grape::API
    auth = 'Token'
    format :json

    rescue_from :all
    error_formatter :json, lambda { |message, backtrace, options, env| 
      { status: 'failed', message: message }.to_json }
    
    resource :api do
      resources :orders do

        get do
#          find_user
          { token: headers[auth], status: :ok }
        end

        post do
          params do
            requires :order do
              requires :date, type: Date
              requires :count, type: Integer
            end
          end


          { token: headers[auth], date: params[:date], count: params[:count], box: params[:box], meal_number: params[:meal_number], status: :created }
        end
      end
    end

    private

    def find_user
      find_user_by_token headers[auth]
    end

    def find_user_by_token token
      raise NotImplementedError
    end

    def self.configure(&block)
      API::Orders::AuthenticationHelpers.define_method :find_user_by_token, :token, &block
    end
  end
end

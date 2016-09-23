#curl -X POST https://vedantdomain.cz/objednavky -d '{"date":"2016-10-25", "meals":3}' -H 'Authentication: 12345abcd' -H 'Content-Type: application/json'

require 'grape'

module API

  class Order < Grape::API

    format :json
    rescue_from :all

    error_formatter :json, lambda { |message, backtrace, options, env|
      {
        status: 'failed',
        message: message,
        error_code: 123
      }.to_json
    }

    resource :api do
      params do
        requires :token, type: String
        requires :date, type: Date
        requires :count, type: Integer
        requires :meal_number, type: Integer
        requires :box, type: Boolean
      end

      get :order do
        user = params[:token]
        date = params[:date] 
        count = params[:count]
        meal_number = params[:meal_number]
        box = params[:box]

        {
          user: user,
          date: date,
          count: count,
          meal_number: meal_number,
          box: box, 
          status: :created
        }

      end

    end

  end

end

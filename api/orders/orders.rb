#curl -X POST https://vedantdomain.cz/objednavky -d '{"date":"2016-10-25", "meals":3}' -H 'Authentication: 12345abcd' -H 'Content-Type: application/json'

require 'grape'
require 'pry'

module API

  class Orders < Grape::API

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
 
        resources :orders do

          get do

            token = headers['Authorization']

            { 
              token: token,
              status: :ok
            }

#            Orders.all
          end

          post do
            params do
              requires :orders do
                requires :date, type: Date
                requires :count, type: Integer
                requires :meal_number, type: Integer
                requires :box, type: Boolean
              end
            end

#            Order.create { "token" => headers['Authorization'], "date" => params[:date], "count" => params[:count], "meal_number" => params[:meal_number], "box" => params[:box] }

            {
              token: headers['Authorization'],
              date: params[:date], 
              count: params[:count],
              meal_number: params[:meal_number],
              box: params[:box],
              status: :created
            }

          end

        end #resource orders

      end #resource api

  end #class Orders

end #module API

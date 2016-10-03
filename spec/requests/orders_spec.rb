require 'spec_helper'
require_relative '../../app/api/orders/orders'

include API

RSpec.describe "GET /api/orders", type: :request do

  def app
    API::Orders
  end

  puts 'testing orders ..............................................'
  let(:index) { 'localhost:4444/api/orders' }
  let(:index2) { 'api/orders' }
    it "returns orders list" do
    app.get '/api/orders'
#    it { is_expected.to respond_with 200 }
 #expect(response.status).to eq(200)
 expect(status).to eq(200)
 expect(last_response.body).to eq({ token: 'null' }.to_json)  
end
#  it {expect(subject).to eql {token: 'null',status: :ok}} 
#  it {expect(subject).to have_http_status(:success)} 
#  it do 
#    get  :index2 

#    expect(response).to have_http_status(:ok)
#  end
  puts 'orders testing finished'
end

#curl -X GET localhost:4444/api/orders -H 'Token: lW1c60hYkRwAinzUqgLfsQ' -H 'Content-Type: application/json'
#curl -X POST localhost:4444/api/orders -d '{"date":"2016-09-30","count":1}' -H 'Token: lW1c60hYkRwAinzUqgLfsQ' -H 'Content-Type: application/json'

require 'spec_helper'

RSpec.describe "GET /api/orders", type: :request do
  it "returns orders list" do
    binding.pry
    get '/api/orders'
    expect(status).to eq(200)
    expect(last_response.body).to eq({ token: 'null' }.to_json)
  end
end

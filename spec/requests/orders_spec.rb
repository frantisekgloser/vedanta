require 'spec_helper'

RSpec.describe "GET /api/orders", type: :request do
  it "returns orders list" do
    get '/api/orders'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq({ token: nil, status: 'ok' }.to_json)
  end
end

require 'rails_helper'

RSpec.describe "Create Subscription API Request" do
  before :each do
    @nick = Customer.create(first_name: "nick", last_name: "jacobs", email: "nickjacobs@gmail.com", address: "123 ABC Street")
    @black = Tea.create(title: "Black Tea", description: "Dark Leaves, highly caffinated", temp: "300F", brew_time: "5 Minutes")
    @sub_params = {
      title: "Black Tea Once",
      price: 5.95,
      frequency: "once",
      tea_id: @black.id,
      customer_id: @nick.id
    }
  end

  describe "happy paths" do
    it "Creates a new subscription for a user" do
      post "/api/v1/customers/#{@nick.id}/subscriptions", params: @sub_params

      subscription = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(subscription[:type]).to eq("subscription")

      expect(subscription[:attributes][:title]).to eq("Black Tea Once")
      expect(subscription[:attributes][:price]).to eq(5.95)
      expect(subscription[:attributes][:status]).to eq("active")
      expect(subscription[:attributes][:frequency]).to eq("once")

      expect(subscription[:attributes][:tea_id]).to eq(@black.id)
      expect(subscription[:attributes][:customer_id]).to eq(@nick.id)
    end
  end

  describe "sad paths" do
    it "gives an error when no tea/customer id is passed" do
      bad_sub_params = {
        title: "Black Tea Once",
        price: 5.95,
        frequency: "once",
      }

      post "/api/v1/customers/#{@nick.id}/subscriptions", params: bad_sub_params
      subscription = JSON.parse(response.body, symbolize_names: true)
      
      expect(subscription[:error]).to eq("Customer must exist and Tea must exist")
    end

    it "gives an error when an attribute is missing" do
      bad_sub_params = {
        title: "Black Tea Once",
        price: 5.95,
        tea_id: @black.id,
        customer_id: @nick.id
      }

      post "/api/v1/customers/#{@nick.id}/subscriptions", params: bad_sub_params
      subscription = JSON.parse(response.body, symbolize_names: true)

      expect(subscription[:error]).to eq("Frequency can't be blank")
    end
  end
end

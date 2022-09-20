require 'rails_helper'

RSpec.describe "Customer Subscription API Cancellation" do
  before :each do
    @nick = Customer.create(first_name: "nick", last_name: "jacobs", email: "nickjacobs@gmail.com", address: "123 ABC Street")
    @black = Tea.create(title: "Black Tea", description: "Dark Leaves, highly caffinated", temp: "300F", brew_time: "5 Minutes")
    @sub = Subscription.create(title: "Black Tea Once", price: 10.15, frequency: 0, customer_id: @nick.id, tea_id: @black.id)
    @sub_params = {
      status: "cancelled"
    }
  end

  describe "happy paths" do
    it "can cancel a currently active subscription" do
      patch "/api/v1/customers/#{@nick.id}/subscriptions/#{@sub.id}", params: @sub_params
      subscription = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(subscription[:attributes][:status]).to eq("cancelled")

      expect(subscription[:attributes][:title]).to eq("Black Tea Once")
      expect(subscription[:attributes][:price]).to eq(10.15)
      expect(subscription[:attributes][:frequency]).to eq("once")
      expect(subscription[:attributes][:tea_id]).to eq(@black.id)
      expect(subscription[:attributes][:customer_id]).to eq(@nick.id)
    end
  end

  describe "sad paths" do
    it "gives an error when subscription ID does not exist" do
      patch "/api/v1/customers/#{@nick.id}/subscriptions/144", params: @sub_params
      subscription = JSON.parse(response.body, symbolize_names: true)

      expect(subscription).to have_key(:error)
      expect(subscription[:error]).to eq("Subscription Requested does not exist")
    end

    it "gives an error when no status param is passed " do
      patch "/api/v1/customers/#{@nick.id}/subscriptions/#{@sub.id}"
      subscription = JSON.parse(response.body, symbolize_names: true)

      expect(subscription).to have_key(:error)
      expect(subscription[:error]).to eq("no status update param given")
    end
  end
end

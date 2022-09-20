require 'rails_helper'

RSpec.describe "User Subscription Index Request" do
  before :each do
    @nick = Customer.create(first_name: "nick", last_name: "jacobs", email: "nickjacobs@gmail.com", address: "123 ABC Street")
    @black = Tea.create(title: "Black Tea", description: "Dark Leaves, highly caffinated", temp: "300F", brew_time: "5 Minutes")
    @green = Tea.create(title: "Green Tea", description: "Light Leaves, high antioxidant content", temp: "350F", brew_time: "10 Minutes")
    Subscription.create(title: "Black Tea Once", price: 10.15, frequency: 0, customer_id: @nick.id, tea_id: @black.id)
    Subscription.create(title: "Green Tea Weekly", price: 5.75, frequency: 1, customer_id: @nick.id, tea_id: @green.id)
  end

  describe "happy path" do
    it "lists users subscription history" do
      get "/api/v1/customers/#{@nick.id}/subscriptions"
      all_subs = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(all_subs[0][:attributes][:title]).to eq("Black Tea Once")
      expect(all_subs[0][:attributes][:price]).to eq(10.15)
      expect(all_subs[0][:attributes][:status]).to eq("active")
      expect(all_subs[0][:attributes][:frequency]).to eq("once")

      expect(all_subs[1][:attributes][:title]).to eq("Green Tea Weekly")
      expect(all_subs[1][:attributes][:price]).to eq(5.75)
      expect(all_subs[1][:attributes][:status]).to eq("active")
      expect(all_subs[1][:attributes][:frequency]).to eq("weekly")
    end
  end

  describe "sad paths" do
    it "gives no subscription found when customer hasnt subscribed before" do
      titan = Customer.create(first_name: "titan", last_name: "jacobs", email: "IamACat@gmail.com", address: "456 DEF Street")
      get "/api/v1/customers/#{titan.id}/subscriptions"
      all_subs = JSON.parse(response.body, symbolize_names: true)

      expect(all_subs[:error]).to eq("This user has never subscribed before")
    end

    it "gives an error when no customer is found" do
      get "/api/v1/customers/12345/subscriptions"
      all_subs = JSON.parse(response.body, symbolize_names: true)

      expect(all_subs[:error]).to eq("No User Associated with that ID")
    end
  end
end

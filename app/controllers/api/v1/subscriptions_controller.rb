class Api::V1::SubscriptionsController < ApplicationController

  def index
    if Customer.exists?(params[:customer_id])
      customer = Customer.find(params[:customer_id])
      if customer.subscriptions.empty?
        render json: {error: "This user has never subscribed before"}
      else
        render json: SubscriptionSerializer.new(customer.subscriptions), status: 200
      end
    else
      render json: {error: "No User Associated with that ID"}
    end 
  end

  def create
    new_sub = Subscription.create(sub_params)
    if new_sub.save
      render json: SubscriptionSerializer.new(new_sub), status: 201
    else
      render json: {error: new_sub.errors.full_messages.to_sentence}, status: 400
    end
  end

  def update
    if params[:status].nil?
      render json: {error: "no status update param given"}
    else
      if Subscription.exists?(params[:subscription_id])
        sub = Subscription.find(params[:subscription_id])
        sub.update(sub_params)
        render json: SubscriptionSerializer.new(sub), status: 200
      else
        render json: {error: "Subscription Requested does not exist"}
      end
    end
  end

  private
  def sub_params
    params.permit(:title, :price, :frequency, :status, :tea_id, :customer_id)
  end

end

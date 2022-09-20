class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :frequency, :status
  belongs_to :customer
  belongs_to :tea

  enum frequency: ["once", "weekly", "monthly"]
  enum status: ["active", "cancelled"]
end

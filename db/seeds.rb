# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subscription.destroy_all
Customer.destroy_all
Tea.destroy_all

nick = Customer.create(first_name: "nick", last_name: "jacobs", email: "nickjacobs@gmail.com", address: "123 ABC Street")
titan = Customer.create(first_name: "titan", last_name: "jacobs", email: "IamACat@gmail.com", address: "456 DEF Street")

black = Tea.create(title: "Black Tea", description: "Dark Leaves, highly caffinated", temp: "300F", brew_time: "5 Minutes")
green = Tea.create(title: "Green Tea", description: "Light Leaves, high antioxidant content", temp: "350F", brew_time: "10 Minutes")

Subscription.create(title: "Black Tea Once", price: 10.15, frequency: 0, customer_id: nick.id, tea_id: black.id)
Subscription.create(title: "Green Tea Weekly", price: 5.75, frequency: 1, customer_id: titan.id, tea_id: green.id)

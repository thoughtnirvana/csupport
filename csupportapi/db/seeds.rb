# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(name:"Steve Jobs", email:"steve@apple.com", password:"password", roles_mask:4)
agent = User.create!(name:"Bill Gates", email:"bill@apple.com", password:"password", roles_mask:2)
customer = User.create!(name:"Jeff Bezos", email:"jeff@amazon.com", password:"password", roles_mask:1)

t1 = Ticket.create!(name:"Ticket1", description:"Amazon Ticket1", user_id:customer.id, status:0)
t2 = Ticket.create!(name:"Ticket2", description:"Amazon Ticket2", user_id:customer.id, status:1)
t3 = Ticket.create!(name:"Ticket3", description:"Amazon Ticket3", user_id:customer.id, status:2)
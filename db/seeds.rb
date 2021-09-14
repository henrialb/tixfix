# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Destroying clients'
Client.destroy_all

puts 'Destroying users'
User.destroy_all

puts 'Destroying organizations'
Organization.destroy_all

puts 'Destroying venues'
Venue.destroy_all

puts 'Destroying events'
Event.destroy_all

puts 'Destroying orders'
Order.destroy_all

puts 'Destroying event categories'
EventCategory.destroy_all

puts 'Destroying tickets'
Ticket.destroy_all
puts 'Done!'

# CREATE RECORDS

# Create organizations

puts "Creating Tixfix Inc."
tixfix = Organization.new(name: 'TixFix', website: 'www.tixfix.xyz')
tixfix.save!
puts "Done!"

15.times do
  organization = Faker::Sports::Football.unique.team
  website = Faker::Internet.domain_name

  Organization.create!(name: organization, website: website)

  puts "Created organization #{organization}"
end

puts 'Done creating organizations!'
organizations = Organization.all

# Create venues

Venue.create!(name: 'Estádio Municipal Mário Wilson', address: 'Rua Coro de Santo Amaro de Oeiras 12')
puts 'Estádio Municipal Mário Wilson added to venues'
Venue.create!(name: 'Estádio José Gomes', address: 'Avenida Dom José Primeiro')
puts 'Estádio José Gomes added to venues'
Venue.create!(name: 'Estádio Municipal de Aveiro', address: 'Aveiro')
puts 'Estádio Municipal de Aveiro added to venues'
Venue.create!(name: 'Estádio Pina Manique', address: 'Avenida Santos Dumont')
puts 'Estádio Pina Manique added to venues'
Venue.create!(name: 'Estádio Municipal do Fontelo', address: 'Avenida José Relvas 6, Viseu')
puts 'Estádio Municipal do Fontelo added to venues'
Venue.create!(name: 'Estádio Marcolino de Castro', address: 'Avenida Clube Desportivo Feirense')
puts 'Estádio Marcolino de Castro added to venues'
Venue.create!(name: 'Estádio Municipal de Mafra', address: 'Parque Desportivo Municipal de Mafra')
puts 'Estádio Municipal de Mafra added to venues'
Venue.create!(name: 'Estádio Municipal José dos Santos Pinto', address: 'Covilhã')
puts 'Estádio Municipal José dos Santos Pinto added to venues'
Venue.create!(name: 'Estádio Municipal 25 de Abril', address: 'Penafiel')
puts 'Estádio Municipal 25 de Abril added to venues'
Venue.create!(name: 'Estádio de São Luís', address: 'Faro')
puts 'Estádio de São Luís added to venues'

puts "Done creating venues!"
venues = Venue.all

# Create clients

100.times do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email = Faker::Internet.email
  phone = Faker::PhoneNumber.phone_number_with_country_code

  Client.create!(
    name: name,
    email: email,
    phone: phone
  )

  puts "Created client #{name}"
end

puts 'Done creating clients!'
clients = Client.all

# Create users

puts "Creating Tixfix-ers"
User.create!(
  name: 'Pedro',
  email: 'pedro@tixfix.xyz',
  password: '12345678',
  role: 1,
  organization: tixfix)

User.create!(name: 'Henrique', email: 'henrique@tixfix.xyz', password: '12345678', role: 1, organization: tixfix)
User.create!(name: 'Thierry', email: 'thierry@tixfix.xyz', password: '12345678', role: 1, organization: tixfix)
User.create!(name: 'Artur', email: 'artur@tixfix.xyz', password: '12345678', role: 1, organization: tixfix)
puts "Done!"

35.times do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email = Faker::Internet.email
  role = rand(0..2)

  User.create!(
    name: name,
    email: email,
    password: '123123',
    role: role,
    organization: organizations.sample
  )

  puts "Created user #{name}"
end

puts 'Done creating users!'

# Create events

21.times do
  organization = organizations.sample
  name = "#{organization.name} vs. #{Faker::Sports::Basketball.team}"
  status = Event.statuses.keys.sample
  starts_at = status == 'past' ? Faker::Time.backward(days: 14) : Faker::Time.forward(days: 23)
  ends_at = starts_at + 7 * 15 * 60

  Event.create!(
    organization: organization,
    venue: venues.sample,
    name: name,
    starts_at: starts_at,
    ends_at: ends_at,
    status: status
  )

  puts "#{name} created!"
end

puts 'Done creating events!'
events = Event.all

# Create event categories
events.each do |event|
  multiplier = rand(1..3)
  EventCategory.create(event: event, price: 5 * multiplier, capacity: 300, name: 'Superior')
  EventCategory.create(event: event, price: 10 * multiplier, capacity: 200, name: 'Lateral')
  EventCategory.create(event: event, price: 15 * multiplier, capacity: 200, name: 'Central')
  puts "Categories created for #{event.name}"
end

puts 'Done creating event categories'

# Create orders

events.each do |event|
  rand(20..100).times do
    client_exists = [true, false].sample
    client = client_exists ? clients.sample : nil

    Order.create!(event: event, client: client)
  end
  puts 'New order created.'
end
puts 'Done creating orders!'

# Create tickets

Order.all.each do |order|
  rand(1..3).times do
    event_category = order.event.event_categories.sample
    is_used = order.event.ends_at < Time.now

    ticket = Ticket.create!(event_category: event_category, order: order, is_used: is_used)
    puts "Ticket #{ticket.hex} created."
  end
end
puts 'Done creating tickets!'

puts 'All seeds planted! 🌱'

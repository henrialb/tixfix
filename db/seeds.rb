# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Destroying users'
User.destroy_all

puts 'Destroying organizations'
Organization.destroy_all

puts 'Destroying venues'
Venue.destroy_all

puts 'Destroying events'
Event.destroy_all

puts 'Destroying event categories'
Event.destroy_all

puts 'Destroying orders'
Venue.destroy_all

puts 'Destroying clients'
Client.destroy_all

puts 'Destroying tickets'
Ticket.destroy_all
puts 'Done!'

# CREATE RECORDS

# Create organizations

15.times do
  organization = Faker::Sports::Football.team
  website = Faker::Internet.domain_name

  Organization.create!(organization: organization, website: website)

  puts "Created organization #{organization}"
end

puts 'Done creating organizations!'
organizations = Organization.all

# Create venues

Venue.create!(name: 'Estádio Municipal Mário Wilson', address: 'Rua Coro de Santo Amaro de Oeiras 12')
puts 'Estádio Municipal Mário Wilson added to venues'
Venue.create!(name: 'Estádio José Gomes', address: 'Avenida Dom José Primeiro')
puts 'Estádio José Gomes added to venues'
Venue.create!(name: 'Estádio Municipal de Aveiro', address: 'Lugar Taboeira, Aveiro')
puts 'Estádio Municipal de Aveiro added to venues'
Venue.create!(name: 'Estádio Pina Manique', address: 'Estrada das Bungavilhas')
puts 'Estádio Pina Manique added to venues'
Venue.create!(name: 'Estádio Municipal do Fontelo', address: 'Avenida José Relvas 6, Viseu')
puts 'Estádio Municipal do Fontelo added to venues'
Venue.create!(name: 'Estádio Marcolino de Castro', address: 'Avenida Clube Desportivo Feirense')
puts 'Estádio Marcolino de Castro added to venues'
Venue.create!(name: 'Estádio Municipal de Mafra', address: 'Parque Desportivo Municipal de Mafra')
puts 'Estádio Municipal de Mafra added to venues'
Venue.create!(name: 'Estádio Municipal José dos Santos Pinto', address: 'Rua Sítio do Pinho do Gaiteiro 7, Covilhã')
puts 'Estádio Municipal José dos Santos Pinto added to venues'
Venue.create!(name: 'Estádio Municipal 25 de Abril', address: 'Rua Futebol Clube de Penafiel, Penafie')
puts 'Estádio Municipal 25 de Abril added to venues'
Venue.create!(name: 'Estádio de São Lúis', address: 'Rua do Sporting Club Farense, Faro')
puts 'Estádio de São Lúis added to venues'

puts "Done creating venues!"

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

35.times do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  email = Faker::Internet.email
  role = rand(0..2)

  User.create!(
    name: name,
    email: email,
    password: '123123',
    role: role,
    organization_id: organization.sample.id
  )

  puts "Created user #{name}"
end

puts 'Done creating users!'

# Create events

25.times do
  organization = organizations.sample
  name = "#{organization.name} vs. #{Faker::Sports::Football.team}"
  status = rand(0..4)
  starts_at = status == 3 ? Faker::Time.backward(days: 14) : Faker::Time.forward(days: 23)
  ends_at = starts_at + 7 * 45 * 60

  Event.create!(
    organization_id: organization.id,
    venue_id: organization.venue.id,
    name: name,
    starts_at: starts_at,
    ends_at: ends_at,
    status: status
  )

  puts "#{name} created!"
end

puts 'Done creating events!'

# Create event categories
events.each do |event|
  multiplier = rand(1..3)
  EventCategory.create(event_id: event.id, price: 5 * multiplier, capacity: 5000, name: 'Superior')
  EventCategory.create(event_id: event.id, price: 10 * multiplier, capacity: 2500, name: 'Lateral')
  EventCategory.create(event_id: event.id, price: 15 * multiplier, capacity: 2500, name: 'Central')
  puts "Categories created for #{event.name}"
end

puts 'Done creating event categories'

# Create orders

events.each do |event|
  rand(20..100).times do
    client_exists = [true, false].sample
    client_id = client_exists ? clients.sample.id : nil

    Order.create!(event_id: event.id, client_id: client_id)
  end
  puts 'New order created.'
end
puts 'Done creating orders!'

# Create tickets

orders.each do |order|
  rand(1..3).times do
    event_category_id = events.event_category.sample.id
    is_used = order.event.ends_at < Time.now
    qr_code_hash = SecureRandom.hex

    Ticket.create!(event_category_id: event_category_id, order_id: order.id, qr_code: qr_code_hash, is_used: is_used)
    puts "Ticket #{qr_code_hash} created."
  end
end
puts 'Done creating tickets!'

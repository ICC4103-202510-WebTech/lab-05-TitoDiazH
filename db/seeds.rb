# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

characters = [
  { first_name: 'Eric', last_name: 'Cartman' },
  { first_name: 'Stan', last_name: 'Marsh' },
  { first_name: 'Kyle', last_name: 'Broflovski' },
  { first_name: 'Kenny', last_name: 'McCormick' },
  { first_name: 'Butters', last_name: 'Stotch' },
  { first_name: 'Wendy', last_name: 'Testaburger' },
  { first_name: 'Randy', last_name: 'Marsh' },
  { first_name: 'Mr.', last_name: 'Mackey' },
  { first_name: 'Chef', last_name: 'Chef' },
  { first_name: 'Jimmy', last_name: 'Valmer' }
]

User.destroy_all
Chat.destroy_all
Message.destroy_all

users = characters.map.with_index do |char, i|
  User.create!(
    email: "#{char[:first_name].downcase}.#{char[:last_name].downcase}@gmail.com",
    first_name: char[:first_name],
    last_name: char[:last_name]
  )
end


10.times do
  sender = users.sample
  reciever = (users - [sender]).sample
  Chat.create!(sender_id: sender.id, reciever_id: reciever.id)
end


10.times do |i|
    Message.create!(
        chat_id: rand(1..10),
        user_id: rand(1..10),
        body: "Message n° #{i + 1}"
    )
end


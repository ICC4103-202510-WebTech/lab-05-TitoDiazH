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
fist_names = ['Eric', 'Stan', 'Kyle', 'Kenny', 'Butters', 'Wendy', 'Randy', 'Mr.', 'Chef', 'Jimmy']
last_names = ['Cartman', 'Marsh', 'Broflovski', 'McCormick', 'Stotch', 'Testaburger', 'Marsh', 'Mackey', 'Chef', 'Valmer']


10.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    first_name: fist_names.sample,
    last_name: last_names.sample
  )
end
users = User.all
10.times do |i|
  sender = users.sample
  receiver = users.where.not(id: sender.id ).sample

  Chat.create!(
    sender_id: sender.id,
    receiver_id: receiver.id
  )
end

chats = Chat.all

10.times do |i|
    chat = chats.sample
    user = chat.sender
    Message.create!(
        chat_id: chat.id,
        user_id: user.id,
        body: "This is a message number #{i + 1} 
        ")
end


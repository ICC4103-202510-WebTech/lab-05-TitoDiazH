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

# Limpia los datos existentes para evitar duplicados
Message.delete_all
Chat.delete_all
User.delete_all

first_names = ['Eric', 'Stan', 'Kyle', 'Kenny', 'Butters', 'Wendy', 'Randy', 'Mr.', 'Chef', 'Jimmy']
last_names  = ['Cartman', 'Marsh', 'Broflovski', 'McCormick', 'Stotch', 'Testaburger', 'Marsh', 'Mackey', 'Chef', 'Valmer']

# Crea usuarios con nombres y apellidos alineados por posición
users = []
first_names.each_with_index do |first_name, i|
  users << User.create!(
    email: "user#{i + 1}@example.com",
    first_name: first_name,
    last_name: last_names[i]
  )
end

# Crea chats entre usuarios (evita que un usuario chatee consigo mismo)
chats = []
users.each_with_index do |sender, i|
  receiver = users[(i + 1) % users.size] # siguiente usuario en la lista
  chats << Chat.create!(
    sender_id: sender.id,
    receiver_id: receiver.id
  )
end

# Crea mensajes en los chats
10.times do |i|
  chat = chats.sample
  user = chat.sender
  Message.create!(
    chat_id: chat.id,
    user_id: user.id,
    body: "This is message number #{i + 1}"
  )
end


class CreateChats < ActiveRecord::Migration[8.0]
  def change
    create_table :Chat do |t|
      t.integer :sender_id
      t.integer :reciever_id

      t.timestamps
    end
  end
end

class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.references :chat, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.text :body, null: false
      
      t.timestamps
    end
  end
end

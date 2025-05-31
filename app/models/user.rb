class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :sent_chats, class_name: 'Chat', foreign_key: 'sender_id'
    has_many :received_chats, class_name: 'Chat', foreign_key: 'receiver_id'
    has_many :messages

    validates :email, presence: true, uniqueness: true

    def full_name
      "#{first_name} #{last_name}"
    end
end

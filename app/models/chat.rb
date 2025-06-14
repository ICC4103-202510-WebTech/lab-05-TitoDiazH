class Chat < ApplicationRecord

    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
    belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
    
    has_many :messages, dependent: :destroy

    validates :sender_id, presence: true
    validates :receiver_id, presence: true
    validate :different_sender_receiver

    scope :participant, -> (current_user) { 
        where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id) 
    }

    def different_sender_receiver
        if sender_id == receiver_id
            errors.add(:receiver_id, "sender_id and receiver_id cant be the same")
        end
    end

    def other_user(current_user)
        if sender_id == current_user.id
            receiver.full_name
        else sender.full_name  
        end
    end
    
    def chat_members
        "#{sender.full_name} - #{receiver.full_name}"
    end

end

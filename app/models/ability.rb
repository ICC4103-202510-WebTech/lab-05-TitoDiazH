class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    
    can :read, :all

    can :create, Message
    can [:update, :destroy], Message, user_id: user.id

    can [:update, :destroy], User, id: user.id
    can :index, User, admin: true
    
    can :create, Chat
    can [:read, :show, :edit, :update, :destroy], Chat, sender_id: user.id
    can [:read, :show, :edit, :update, :destroy], Chat, receiver_id: user.id

    
  end
end
class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all

    can :create, Message
    can [:update, :destroy], Message, user_id: user.id
    can :read, Message, user_id: user.id
    can :show, Message, user_id: user.id
    can :edit, Message, user_id: user.id

    can :create, Chat
    can :edit, Chat do |chat|
      chat.sender == user || chat.receiver == user
    end
    can :show, Chat do |chat|
      chat.sender == user || chat.receiver == user
    end

    can :edit, User, id: user.id
    can :update, User, id: user.id

    can :show, User
    can :index, User
  end
end
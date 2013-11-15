class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.is? :admin
      can :manage, :all
    elsif ((user.is? :member) || (user.is? :moderator))
      can :read, :all
      can :create, [Contest, Entry, Character, User, Portrait]
      can :update, [Contest, Entry, Character, User], user_id: user.id
      can :update, :destroy, Portrait do |portrait|
        portrait.character.user_id == user.id
      end
      can :destroy, [Entry, User], user_id: user.id
    else
      can :read, :all
    end
  end
end

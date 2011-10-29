class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.isadmin?
      can :manage, :all
    elsif user.username == nil
      can :read, [Book, Copy, Author]
      can :create, User
      cannot :read, Request
      cannot :create, Request
    else
      can :read, :all
      can :create, User
      can :create, Request
    end
  end
end

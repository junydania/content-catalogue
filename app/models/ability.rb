class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.administrator?
      can :manage, :all
    elsif user.standard?
      can [:update, :create, :read], [Publisher, Category, Comedian, Video]
      can [:update, :read], User, id: user.id
      cannot :destroy, [Publisher, Category, Comedian, Video]
    else
      can :read, [Publisher, Category, Comedian, Video]
      can [:update, :read], User, id: user.id
      cannot [:destroy, :update], [Publisher, Category, Comedian, Video]
    end
  end
end



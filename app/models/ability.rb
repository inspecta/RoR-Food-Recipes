class Ability
  include CanCan::Ability

  def initialize(user)
    # Case of a guest user
    user ||= User.new

    can :read, Recipe
    can :read, RecipeFood

    # Only owner of a recipe can delete it
    can :create, :all
    can :delete, Recipe, user_id: user.id

    # Show public recipe to owner also
    # can :show, Recipe, user_id: user.id
  end
end

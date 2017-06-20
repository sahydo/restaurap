class IngredientPolicy
  attr_reader :user, :ingredient

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
  end

  def index?
    user.admin? or user.chef?
  end

  def show?
    (user.admin? or user.chef?) and scope.where(:id => ingredient.id).exists?
  end

  def create?
    user.admin? or user.chef?
  end

  def new?
    create?
  end

  def update?
    user.admin? or user.chef?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? or user.chef?
  end

  def scope
    Pundit.policy_scope!(user, ingredient.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

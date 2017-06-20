class ProductPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def index?
    true
  end

  def show?
    scope.where(:id => product.id).exists?
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
    Pundit.policy_scope!(user, product.class)
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

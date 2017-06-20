class TypeProductPolicy
  attr_reader :user, :type_product

  def initialize(user, type_product)
    @user = user
    @type_product = type_product
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? and scope.where(:id => type_product.id).exists?
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  def scope
    Pundit.policy_scope!(user, type_product.class)
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

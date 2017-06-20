class TotalProductPolicy
  attr_reader :user, :total_product

  def initialize(user, total_product)
    @user = user
    @total_product = total_product
  end

  def index?
    user.admin? or user.chef? or user.waiter?
  end

  def show?
    (user.admin? or user.chef?) and scope.where(:id => total_product.id).exists?
  end

  def create?
    user.admin? or user.chef? or user.waiter?
  end

  def new?
    create?
  end

  def update?
    user.admin? or user.chef? or user.waiter?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? or user.chef? or user.waiter?
  end

  def scope
    Pundit.policy_scope!(user, total_product.class)
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

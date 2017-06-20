class UserPolicy
  attr_reader :user, :user1

  def initialize(user, record)
    @user = user
    @user1 = record
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? and scope.where(:id => user.id).exists?
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
    Pundit.policy_scope!(user, user.class)
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

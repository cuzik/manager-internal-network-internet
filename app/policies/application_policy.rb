class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.owner?
  end

  def show?
    default_authorize
  end

  def create?
    index?
  end

  def new?
    create?
  end

  def update?
    default_authorize
  end

  def edit?
    update?
  end

  def destroy?
    default_authorize
  end

  def scope
    Pundit.policy_scope!(user, record.class)
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

  private

  def default_authorize
    user.owner? && user.account == record.account
  end
end

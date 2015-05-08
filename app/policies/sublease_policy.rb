class SubleasePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    @current_user.admin?    
  end

  def edit?
    @current_user.admin?
  end

  def new?
    @current_user.user? || @current_user.vip? || @current_user.admin?
  end

  def create?
    @current_user.user? || @current_user.vip? || @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end
end

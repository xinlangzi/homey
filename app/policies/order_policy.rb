class OrderPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @model = model
  end

  def index?
    @current_user.vip?
  end

  def show?
    @current_user.admin? || @current_user.customer_service? || @current_user.vip?
  end

  def update?
    @current_user.admin? || @current_user.customer_service?
  end

  def edit?
    @current_user.admin? || @current_user.customer_service?
  end

  def new?
    @current_user.admin? || @current_user.customer_service?
  end

  def create?
    @current_user.admin? || @current_user.customer_service?
  end

  def destroy?
    @current_user.admin?
  end

  def renew_lease?
    @current_user.admin? || @model.user == @current_user
  end

  def renew_internet?
    @current_user.admin? || @model.user == @current_user
  end
end

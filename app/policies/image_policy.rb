class ImagePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
  end

  def create?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end
end

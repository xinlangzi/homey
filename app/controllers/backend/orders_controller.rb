class Backend::OrdersController < Backend::BaseController

  before_action :set_user
  def new
    @order = @user.orders.new
    authorize @order
  end

  private
    def set_user
      @user = User.find_by(id: params[:user_id])
    end

end

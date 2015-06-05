class Backend::OrdersController < Backend::BaseController
  before_action :set_user
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_user.orders
    authorize @orders
  end

  def new
    @order = @user.orders.new
    authorize @order
  end

  def show
  end

  def edit
    @order.property_id_string = @order.property.property_id
  end

  def create
    @order = @user.orders.build(order_params)
    authorize @order

    respond_to do |format|
      if @order.save
        format.html { redirect_to [:backend, @user, @order], notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        @order.errors.add(:property_id_string, "invalid Property ID") if @order.errors[:property].present?
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to [:backend, @user, @order], notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        @order.errors.add(:property_id_string, "invalid Property ID") if @order.errors[:property].present?
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to [:backend, @user], notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = case current_user.role.titleize
      when "Vip"
        current_user
      when "Admin", "Customer Service"
        User.find_by(id: params[:user_id])
      else
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = @user.orders.find_by(id: params[:id])
      authorize @order
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(
        :name, :property_id_string, :lease_start, :lease_end, :bank_account, :rent, :period_length, :pre_alert_day, :user_id,
        charges_attributes: [:category, :amount, :due_date, :note, :paid, :_destroy, :id]
      )
    end
  end

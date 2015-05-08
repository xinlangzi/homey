class Backend::SystemsController < Backend::BaseController
  before_action :set_system, only: [:edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @system.update(system_params)
        format.html { redirect_to edit_backend_system_path(0), notice: 'System was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system
      @system = System.default
      authorize @system
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def system_params
      params.require(:system).permit(:logo, :slogan, :email, :phone)
    end
end

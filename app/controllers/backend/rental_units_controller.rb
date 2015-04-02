class Backend::RentalUnitsController < Backend::BaseController
  before_action :set_rental_unit, only: [:show, :edit, :update, :destroy]

  # GET /rental_units
  # GET /rental_units.json
  def index
    @rental_units = RentalUnit.all
    authorize RentalUnit
  end

  # GET /rental_units/1
  # GET /rental_units/1.json
  def show
  end

  # GET /rental_units/new
  def new
    @rental_unit = RentalUnit.new
    authorize @rental_unit
  end

  # GET /rental_units/1/edit
  def edit
    @photo = @rental_unit.photos.build
  end

  # POST /rental_units
  # POST /rental_units.json
  def create
    @rental_unit = RentalUnit.new(rental_unit_params)
    authorize @rental_unit

    respond_to do |format|
      if @rental_unit.save
        format.html { redirect_to [:backend, @rental_unit], notice: 'Rental unit was successfully created.' }
        format.json { render :show, status: :created, location: @rental_unit }
      else
        format.html { render :new }
        format.json { render json: @rental_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rental_units/1
  # PATCH/PUT /rental_units/1.json
  def update
    respond_to do |format|
      if @rental_unit.update(rental_unit_params)
        format.html { redirect_to [:backend, @rental_unit], notice: 'Rental unit was successfully updated.' }
        format.json { render :show, status: :ok, location: [:backend, @rental_unit] }
      else
        format.html { render :edit }
        format.json { render json: @rental_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rental_units/1
  # DELETE /rental_units/1.json
  def destroy
    @rental_unit.destroy
    respond_to do |format|
      format.html { redirect_to backend_rental_units_url, notice: 'Rental unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_unit
      @rental_unit = RentalUnit.find(params[:id])
      authorize @rental_unit
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_unit_params
      params.require(:rental_unit).permit(:title, :property_id, :price, :number_of_bedrooms, :number_of_bathrooms, :number_of_dens, :number_of_storage_rooms, :surface_area, :utility_charge_included, :district_id, :short_term_lease, :business_center, :available_date)
    end
end

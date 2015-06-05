class Backend::PropertiesController < Backend::BaseController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /propertys
  # GET /propertys.json
  def index
    @search = Property.search(params[:q])
    @properties = @search.result.page(params[:page])
    authorize Property
    authorize Property, :new?
  end

  # GET /propertys/1
  # GET /propertys/1.json
  def show
  end

  # GET /propertys/new
  def new
    @property = Property.new
    authorize @property
  end

  # GET /propertys/1/edit
  def edit
    @image = @property.images.build
  end

  # POST /propertys
  # POST /propertys.json
  def create
    @property = Property.new(property_params)
    authorize @property

    respond_to do |format|
      if @property.save
        format.html { redirect_to [:backend, @property], notice: 'Rental unit was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /propertys/1
  # PATCH/PUT /propertys/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to [:backend, @property], notice: 'Rental unit was successfully updated.' }
        format.json { render :show, status: :ok, location: [:backend, @property] }
      else
        @image = @property.images.build
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /propertys/1
  # DELETE /propertys/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to backend_properties_url, notice: 'Rental unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.friendly.find(params[:id])
      authorize @property
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      furnitures = Property::FURNITURES.keys
      features = Property::FEATURES.keys
      facilities = Property::FACILITIES.keys
      params.require(:property).permit(
        :category, :title, :price, :bedrooms, :bathrooms, :dens, :storage_rooms,
        :surface_area, :utility_charge_included, :district_id, :area_id, :long_term_lease, :short_term_lease,
        :business_center, :available_date, *furnitures, *features, *facilities, :transportation,
        :map
      )
    end
end

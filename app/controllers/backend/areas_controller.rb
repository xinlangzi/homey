class Backend::AreasController < Backend::BaseController
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  # GET /backend/areas
  # GET /backend/areas.json
  def index
    @areas = Area.all
    authorize Area
  end

  # GET /backend/areas/1
  # GET /backend/areas/1.json
  def show
  end

  # GET /backend/areas/new
  def new
    @area = Area.new
    authorize @area
  end

  # GET /backend/areas/1/edit
  def edit
  end

  # POST /backend/areas
  # POST /backend/areas.json
  def create
    @area = Area.new(area_params)
    authorize @area

    respond_to do |format|
      if @area.save
        format.html { redirect_to [:backend, @area], notice: 'Area was successfully created.' }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/areas/1
  # PATCH/PUT /backend/areas/1.json
  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to [:backend, @area], notice: 'Area was successfully updated.' }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/areas/1
  # DELETE /backend/areas/1.json
  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to backend_areas_url, notice: 'Area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
      authorize @area
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_params
      params.require(:area).permit(:name)
    end
end

class Backend::SubleasesController < Backend::BaseController
  before_action :set_sublease, only: [:show, :edit, :update, :destroy]

  # GET /subleases
  # GET /subleases.json
  def index
    @subleases = Sublease.all
    authorize Sublease    
  end

  # GET /subleases/1
  # GET /subleases/1.json
  def show
  end

  # GET /subleases/new
  def new
    @sublease = Sublease.new
    authorize @sublease
  end

  # GET /subleases/1/edit
  def edit
  end

  # POST /subleases
  # POST /subleases.json
  def create
    @sublease = Sublease.new(sublease_params)
    authorize @sublease
    
    respond_to do |format|
      if @sublease.save
        format.html { redirect_to [:backend, @sublease], notice: 'Sublease was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /subleases/1
  # PATCH/PUT /subleases/1.json
  def update
    respond_to do |format|
      if @sublease.update(sublease_params)
        format.html { redirect_to [:backend, @sublease], notice: 'Sublease was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /subleases/1
  # DELETE /subleases/1.json
  def destroy
    @sublease.destroy
    respond_to do |format|
      format.html { redirect_to backend_subleases_url, notice: 'Sublease was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sublease
      @sublease = Sublease.find(params[:id])
      authorize @sublease
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sublease_params
      params.require(:sublease).permit(:title, :content)
    end
end

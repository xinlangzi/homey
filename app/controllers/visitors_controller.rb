class VisitorsController < ApplicationController
  skip_filter :authenticate_user!

  def index
    @properties = Property.page(params[:page]).per(12)
  end
end

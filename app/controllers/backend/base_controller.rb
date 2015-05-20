class Backend::BaseController < ApplicationController
  layout 'backend'

  before_filter :authenticate_user!
  after_action :verify_authorized

  def index
    authorize current_user, :backend?
  end
end
class Backend::BaseController < ApplicationController
  layout 'backend'

  before_filter :authenticate_user!
  after_action :verify_authorized
end
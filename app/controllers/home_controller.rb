class HomeController < ApplicationController
  before_filter :authenticate_user!
  # GET /
  def index
  end
end

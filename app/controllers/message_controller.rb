class MessageController < ApplicationController
  respond_to :json

  # POST message/create
  def create
    if params[:message].blank?
      @success = false
      @error = "Message can't be blank"
    else
      @success = true
    end
  end
end

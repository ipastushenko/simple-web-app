class MessagesController < ApplicationController
  # GET /
  def index
  end

  # POST messages/message_template(json) 
  def message_template
    if params[:message].try(:present?)
      render json: { 
        success: true
      }
    else
      render json: {
        success: false,
        error: "Message can't be black"
      }
    end
  end
end

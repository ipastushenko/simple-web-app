class MessagesController < ApplicationController

  # GET /
  def index
  end

  # POST messages/message_template(text/html) 
  def message_template
    render partial: 'message_template', locals: { message: params[:message] }
  end
end

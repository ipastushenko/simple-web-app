class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    self.resource = warden.authenticate!(
      scope: resource_name, 
      recall: "#{controller_path}#failure"
    )

    render status: 200, json: { 
      success: true,
      user: current_user
    }
  end

  def destroy
    warden.authenticate!(
      scope: resource_name, 
      recall: "#{controller_path}#failure"
    )
    sign_out

    render status: 200, json: { 
      success: true
    }
  end

  def show_current_user
    warden.authenticate!(
      scope: resource_name, 
      recall: "#{controller_path}#failure"
    )

    render status: 200, json: { 
      success: true,
      user: current_user
    }
  end

  def failure
    render status: 401, json: { 
      success: false
    }
  end
end

class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    self.resource = warden.authenticate!(
      scope: resource_name, 
      recall: "#{controller_path}#failure"
    )

    render json: { 
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

    render json: { 
      success: true
    }
  end

  def show_current_user
    warden.authenticate!(
      scope: resource_name, 
      recall: "#{controller_path}#failure"
    )

    render json: { 
      success: true,
      user: current_user
    }
  end

  def failure
    render json: { 
      success: false
    }
  end

  def require_no_authentication
    assert_is_devise_resource!
    return unless is_navigational_format?
    no_input = devise_mapping.no_input_strategies

    authenticated = if no_input.present?
      args = no_input.dup.push :scope => resource_name
      warden.authenticate?(*args)
    else
      warden.authenticated?(resource_name)
    end

    if authenticated && warden.user(resource_name)
      render json: { 
        success: true,
        user: current_user
      }
    end
  end
end

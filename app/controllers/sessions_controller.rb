class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    self.resource = warden.authenticate!(
      scope: resource_name, 
      recall: "#{controller_path}#create_failure"
    )

    user = current_user
    render json: { 
      success: true,
      user: user,
      info: "Welcome, #{ user.email }"
    }
  end

  def destroy
    warden.authenticate!(
      scope: resource_name, 
      recall: "#{controller_path}#destroy_failure"
    )
    sign_out

    render json: { 
      success: true,
      info: "Good bye!"
    }
  end

  def show_current_user
    warden.authenticate!(
      scope: resource_name, 
      recall: "#{controller_path}#show_user_failure"
    )

    render json: { 
      success: true,
      user: current_user
    }
  end

  def create_failure
    render json: {
      success: false,
      error: "Invalid email or password"
    }
  end

  def destroy_failure
    render json: {
      success: false,
      error: "You are not logged!"
    }
  end

  def show_user_failure
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
        success: false,
        error: "You already logged as #{ current_user.email }"
      }
    end
  end
end

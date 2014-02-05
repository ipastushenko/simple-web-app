class CustomFailure < Devise::FailureApp
  def respond
    if warden_message == :unconfirmed
      warden_options[:recall] = "sessions#confirm_failure"
    end

    if http_auth?
      http_auth
    elsif warden_options[:recall]
      recall
    else
      redirect
    end
  end
end

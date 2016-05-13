class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  #Dynamic handling of all provider. No need to declare different method for each provider
  def action_missing(name)
    if User::AUTH_PROVIDER.include?(name.to_sym)
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
      else
        session["devise.#{name}_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end

  def failure
    redirect_to root_path
  end
end

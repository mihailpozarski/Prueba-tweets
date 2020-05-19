class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters # rubocop:disable Metrics/MethodLength
    devise_parameter_sanitizer.permit(:account_update) do |u| 
      u.permit(
        :avatar,
        :username,
        :email,
        :password,
        :password_confirmation,
        :current_password
      )
    end
    devise_parameter_sanitizer.permit(:sign_up) do |u| 
      u.permit(
        :avatar,
        :username,
        :email,
        :password,
        :password_confirmation
      )
    end
  end
  before_action :authenticate_user!
end

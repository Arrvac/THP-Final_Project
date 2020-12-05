class ApplicationController < ActionController::Base
    before_action :configure_devise_parameters, if: :devise_controller?

    def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :adress, :adress_sup, :door_code, :city, :zipcode, :phone_number, :email, :current_password, :password, :password_confirmation)}
    end

    def after_sign_in_path_for(resource)
        if resource.is_a?(Admin)
            abonnements_path
        end
    end
end

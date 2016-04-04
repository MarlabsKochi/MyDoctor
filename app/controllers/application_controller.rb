class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
    	if params.has_key?("doctor")
        devise_parameter_sanitizer.for(:sign_up) << :name << :age << :phone_number << :doctor_category_id
      else params.has_key?("patients")
  	    devise_parameter_sanitizer.for(:sign_up) << :name << :age << :phone_number
      end
    end
end

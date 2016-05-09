class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout :resolve_layout
   
  private

    def resolve_layout
      action_name == "new" ? "login" : "application"
    end


  protected

    def configure_permitted_parameters
    	if params[:controller].to_s == "patients/registrations"
       devise_parameter_sanitizer.for(:sign_up) << :name << :age << :phone_number 
      else
       devise_parameter_sanitizer.for(:sign_up) << :name << :age << :phone_number << :doctor_category_ids 
      end
    end
end

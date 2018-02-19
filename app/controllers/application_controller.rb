class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :store_user_location!, if: :storable_location?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :email, :mobile_no, :password])
  end

  private
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      store_location_for(:member, request.fullpath)
    end

   	def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
    end

    def after_sign_out_path_for(resource_or_scope)
      request.referrer || super
	end
end

class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	end

  	def after_sign_out_path_for(resource)
      flash[:signout] = 'Signed out successfully'
  		root_path
  	end

  	def after_sign_up_path_for(resource)
  		redirect_to user_path(current_user.id), flash: {signup: 'Welcome! You have signed up successfully'}
  	end

  	def after_sign_in_path_for(resource)
      flash[:signin] = 'Signed in successfully'
  		user_path(current_user.id)
  	end
end

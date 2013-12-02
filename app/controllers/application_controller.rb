class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 before_filter :update_sanitized_params, if: :devise_controller?

	def update_sanitized_params
	  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit( 
	  																												:email,
	  																												:password,
	  																												:first_name, 
	  																												:last_name,
	  																												:address1,
	  																												:address2,
	  																												:region,
	  																												:country,
	  																												:suburb,
	  																												:postcode,
	  																												:home_phone,
	  																												:mobile_phone,
	  																												:dob_day,
	  																												:dob_month,
	  																												:dob_year
	  																											)
																							}
	end
end

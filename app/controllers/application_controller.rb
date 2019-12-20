class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_customer!

	def after_sign_in_path_for(resource)
		root_path
	end

	def after_log_in_path_for(resource)
		root_path
		flash[:notice] = "Signed out successfully"
	end

	def after_sign_out_path_for(resource)
		root_path
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,
			:first_name_kana,:phone_number,:customers_postal_code,
			:customers_address,:email])

		devise_parameter_sanitizer.permit(:sign_in, keys: [:last_name,:first_name,:last_name_kana,
			:first_name_kana,:phone_number,:customers_postal_code,:customers_address])
	end
end

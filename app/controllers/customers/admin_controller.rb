class Customers::AdminController < ApplicationController
	before_action :authenticate_admin!

	def after_sign_out_path_for(resource)
    redirect_to new_admin_session_path
  end

	def index
		@customers = Customer.with_deleted.page(params[:page]).reverse_order
	end

	def show
		@customer = Customer.with_deleted.find(params[:id])
	end

	def edit
		@customer = Customer.with_deleted.find(params[:id])
	end

	def update
		customer = Customer.with_deleted.find(params[:id])
  		customer.update(customer_params)
  		redirect_to admin_path(customer)
	end

	def destroy
		customer = Customer.with_deleted.find(params[:id])
		customer.destroy
		redirect_to new_admin_session_path
	end

	def active
		customer = Customer.with_deleted.find(params[:id])
		customer.restore
		redirect_to admin_index_path
	end

	private

	def customer_params
	   params.require(:customer).permit(:last_name_kana, :first_name_kana, :last_name, :first_name, :customers_postal_code,
	  	 :customers_address, :phone_number, :email, :encrypted_password)
	end
end

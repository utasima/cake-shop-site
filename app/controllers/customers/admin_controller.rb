class Customers::AdminController < ApplicationController
	def index
		@customers = Customer.with_deleted.page(params[:page]).reverse_order
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		customer = Customer.find(params[:id])
  		customer.update(customer_params)
  		redirect_to customer_path(customer)
	end

	def destroy
		customer = Customer.find(params[:id])
		customer.destroy
		redirect_to admin_index_path
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

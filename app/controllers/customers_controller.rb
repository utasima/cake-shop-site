class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def edit
  	@customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = User.new
  end

  def update
  	customer = Customer.find(params[:id])
  	customer.update(customer_params)
  	redirect_to customer_path(customer)
  end

  def edit_password
  	@customer = Customer.new
  end

  def update_password
  	current_customer.reset_password(params[:customer][:password],params[:customer][:password_confirmation])
  	redirect_to new_customer_session_path
  end

  def new_Unsubscribe
  	current_customer
  end

  def destroy
  	customer = Customer.find(params[:id])
  	customer.destroy
  	redirect_to root_path
  end

  def cancel
  end

  private
  def customer_params
  	  params.require(:customer).permit(:last_name_kana, :first_name_kana, :last_name, :first_name, :customers_postal_code,
  	  	:customers_address, :phone_number, :email, :encrypted_password)
  end

end

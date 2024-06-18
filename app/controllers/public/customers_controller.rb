class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer=current_customer
  end
  
  def edit
    @customer=current_customer
  end
  
  def update
    
    if current_customer.update(customer_params)
      redirect_to customers_path
    
    else
      @customer=current_customer
      render :edit
    
    end
    
    
  end
  
  def quit
    
  end
  
  def withdrawal
    current_customer.update(is_active: false)
    sign_out(current_customer)
  end
  
  
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :email, :phone_number, :is_active)
  end
  
end

class Public::AddressesController < ApplicationController
  def index
    @addresses=Address.all
    @address=Address.new
  end

  def edit
    @address=Address.find(params[:id])
  end
  
  def create
    @address=Address.new(adress_params)
    if @address.save
      redirect_to addresses_path
    else
      @addresses=Address.all
      render :index
    end
  end
  
  def update
    @address=Address.find(params[:id])
    if @address.update(adress_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end
  
  def destroy
    Address.find(params[:id]).destroy
    redirect_to addresses_path
  end
  
  private
  
  def adress_params
    params.require(:address).permit(:customer_id,:address,:ad_number,:addressee)
    
  end
end

class Public::OrdersController < ApplicationController
  def new
    if current_customer.cart_items.count==0
      flash[:notice] = "カートが空です"
      redirect_to cart_items_path
    end
    @order=Order.new
  end

  def index
    @orders=Order.where(customer_id: current_customer)
  end

  def show
    @order_details=OrderDetail.where(order_id: params[:id])
    @order=Order.find(params[:id])
  end
  
  def pre_create
    @order=Order.new(order_params)
    verification
    @cart_items=current_customer.cart_items
  end
  
  def create
    order=Order.new(order_params)
    order.status=0
    if order.save
      save_order_detail(order.id)
      current_customer.cart_items.destroy_all
      redirect_to done_orders_path
    end
  end
  
  def done
    
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method,:address, :postal_number, :addressee,:customer_id, :postage, :charge)
  end
  
  def verification
    if params[:order][:address_option] == "0"
      @order.postal_number = current_customer.postal_code 
      @order.address = current_customer.address 
      @order.addressee = current_customer.name

    elsif  params[:order][:address_option] == "1"
      @order.postal_number = Address.find(params[:order][:address_id]).ad_number 
      @order.address = Address.find(params[:order][:address_id]).address 
      @order.addressee = Address.find(params[:order][:address_id]).addressee 

    elsif params[:order][:address_option] == "2"
      @address = Address.new
      @address.address = params[:order][:address] 
      @address.addressee = params[:order][:addressee]
      @address.ad_number = params[:order][:postal_number]
      @address.customer_id = current_customer.id 
      if @address.save
        @order.postal_number = @address.ad_number
        @order.addressee = @address.addressee
        @order.address = @address.address
      else
        flash[:notice]="failed to save address"
        render 'new'
      end
    end
  end
  
  def save_order_detail(i)
    current_customer.cart_items.each do |cart_item|
      order_detail=OrderDetail.new
      order_detail.order_id=i
      order_detail.item_id=cart_item.item.id
      order_detail.amount=cart_item.quantity
      order_detail.price_add_tax=cart_item.item.price_no_tax*1.1
      order_detail.making_status=0
      order_detail.save
    end
  end
end
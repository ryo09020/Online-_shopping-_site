class Admin::OrdersController < ApplicationController
  
  def index
    @orders=Order.all
  end
  
  def show
    @order=Order.find(params[:id])
  end
  
  def update
    order=Order.find(params[:id])
    if order.update(order_params)
      if order.status== "paid"
        order.order_details.update_all(making_status: 1)
      end
      binding.pryorder
      redirect_to admin_order_path(order.id)
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
  
  def status_connect
    if order.status==1
      order.order_details.update_all(making_status: 1)
    end
  end
end

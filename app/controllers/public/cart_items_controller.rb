class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.all
  end
  
  def create
    if cart_item=CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.quantity=cart_item.quantity+CartItem.new(cart_item_params).quantity
    else
      cart_item=CartItem.new(cart_item_params)
    end
    
    if cart_item.save
      redirect_to cart_items_path
    end
      
  end
  
  def update
    cart_item=CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      redirect_to cart_items_path
    end
  end
  
  def destroy_all
    current_customer.cart_items.all.destroy_all
    redirect_to cart_items_path
  end
  
  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to cart_items_path
  end
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:customer_id,:item_id,:quantity)
  end
  
end

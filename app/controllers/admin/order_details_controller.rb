class Admin::OrderDetailsController < ApplicationController
    def update
        order_detail=OrderDetail.find(params[:id])
        if order_detail.update(order_detail_params)
            if order_detail.making_status == "creating"
                order_detail.order.update(status: 2)
            elsif order_detail.making_status == "created"
                order_detail.order.update(status: 3)
            end
            redirect_to admin_order_path(order_detail.order_id)
        end
    end
    
    private
    
    def order_detail_params
        params.require(:order_detail).permit(:making_status)
    end
end
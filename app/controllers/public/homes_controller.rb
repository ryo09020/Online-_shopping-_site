class Public::HomesController < ApplicationController
    def top
        @products = Item.order(created_at: :desc)
    end
    
    def about
        
    end
end

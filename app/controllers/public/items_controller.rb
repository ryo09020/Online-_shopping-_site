class Public::ItemsController < ApplicationController
  def index
    
    genre=params[:genre_id]
    if genre
      @items=Item.where(genre_id: genre)
      
    else
      @items=Item.all
    end
  end

  def show
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
  end
end

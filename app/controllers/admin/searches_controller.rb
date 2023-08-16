class Admin::SearchesController < ApplicationController
  
  def search
    @items =Item.where("name LIKE?","%#{params[:word]}%")
    render 'admin/items/index'
  end
end

class Public::GenreSearchesController < ApplicationController
    
    def search
        genre=Genre.find(params[:id])
        @items =Item.where(genre_id: genre.id)
        render 'public/items/index'
    end
end

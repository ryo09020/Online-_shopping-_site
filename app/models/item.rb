class Item < ApplicationRecord
    has_one_attached :image
    belongs_to :genre
    has_many :cart_items,dependent: :destroy
    # validates:image, presence:true
    validates:genre_id, presence: true
    validates:name, presence: true
    validates:body, presence: true
    validates:price_no_tax, presence: true
    
end

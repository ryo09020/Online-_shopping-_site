class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    
    enum making_status: { unable: 0, pre_create: 1, creating: 2, created: 3 }
    
end

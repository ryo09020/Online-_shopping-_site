class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: { waiting_for_payment: 0, paid: 1, in_production: 2,
                                    pre_shipping_process: 3, shipped: 4 }
    
    def address_display
        '〒' + postal_number + ' ' + address + ' ' + addressee
    end
end

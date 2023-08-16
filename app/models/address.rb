class Address < ApplicationRecord
    belongs_to :customer
    validates:address, presence: true
    validates:ad_number, presence: true
    validates:addressee, presence: true
    
    def address_display
        '〒' +ad_number + ' ' + address + ' ' + addressee
    end
end

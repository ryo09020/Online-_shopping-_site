class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items,dependent: :destroy
  has_many :addresses,dependent: :destroy
  has_many :orders,dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates:last_name, presence: true
  validates:last_name_kana, presence: true
  validates:first_name, presence: true
  validates:first_name_kana, presence: true
  validates:postal_code, presence: true
  validates:address, presence: true
  validates:email, presence: true
  validates:phone_number, presence: true
  
  def address_display
        '〒' + postal_code + ' ' + address + ' ' + last_name + first_name
  end
  
  def name
    last_name + " " + first_name
  end
  
  def name_kana
    last_name_kana + " " + first_name_kana
  end

end
